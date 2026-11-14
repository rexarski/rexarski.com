#!/usr/bin/env fish
# Refreshes the generated data files: rowing meters (concept2_scraper.fish) and
# related posts (generate_post_embeddings.py, via LM Studio). Extra arguments
# go to the Python script, e.g. `./refresh.fish --refresh` rebuilds the cache.
#
# LM Studio is left as it was found: the embedding model is unloaded only if
# this script loaded it, and the server and app stop only if this script
# started them.

cd (status dirname)

./concept2_scraper.fish
or echo "refresh: concept2 failed; continuing with related posts" >&2

if not command -q lms
    echo "refresh: lms (LM Studio CLI) not found; skipping related posts" >&2
    exit 1
end

# The Python script is the one place the model name is written down.
set -l model (string replace -rf '^MODEL_NAME = "([^"]+)".*' '$1' <generate_post_embeddings.py)[1]

# Probe before any lms call: lms itself boots the LM Studio service.
set -l app_was_running (pgrep -f 'LM Studio.app/Contents/MacOS/LM Studio' >/dev/null; and echo 1)
set -l server_was_running (lms server status 2>&1 | string match -q '*is running*'; and echo 1)
set -l model_was_loaded (lms ps 2>/dev/null | string match -q "*$model*"; and echo 1)

test -n "$server_was_running"; or lms server start
test -n "$model_was_loaded"; or lms load $model --yes

python3 generate_post_embeddings.py $argv
set -l result $status

test -n "$model_was_loaded"; or lms unload $model
test -n "$server_was_running"; or lms server stop
if test -z "$app_was_running"
    # Right after `lms server stop` the app can ignore a quit, so retry.
    for attempt in (seq 10)
        pgrep -f 'LM Studio.app/Contents/MacOS/LM Studio' >/dev/null; or break
        osascript -e 'quit app "LM Studio"' 2>/dev/null
        sleep 1
    end
    pgrep -f 'LM Studio.app/Contents/MacOS/LM Studio' >/dev/null
    and echo "refresh: LM Studio is still running; quit it by hand" >&2
end

exit $result
