#!/usr/bin/env fish
# Scrapes lifetime meters from the Concept2 logbook profile into
# data/concept2_distance.json (the rowing progress bar on /now).

set -l url https://log.concept2.com/profile/2691778
set -l out data/concept2_distance.json

cd (status dirname)

echo "Scraping Concept2 logbook: $url"
set -l page (curl -fsS $url)
if test $status -ne 0; or test -z "$page"
    echo "concept2: failed to download the profile page" >&2
    exit 1
end

# The value sits in <div class="stat__figure"><span>267,322</span></div>,
# followed by <div class="stat__name">Lifetime Meters</div>.
set -l meters (printf '%s\n' $page | grep -A15 stat__figure | grep -A15 -B5 'Lifetime Meters' \
    | string match -rg '<span>([0-9,]+)</span>')[1]
if test -z "$meters"
    echo "concept2: no lifetime meters on the page; page preview:" >&2
    printf '%s\n' $page[1..20] >&2
    exit 1
end
set meters (string replace -a , '' $meters)

mkdir -p (path dirname $out)
printf '{\n  "lifetime_meters": %s,\n  "source_url": "%s"\n}\n' $meters $url >$out.tmp
and mv $out.tmp $out
echo "Lifetime meters: $meters → $out"
