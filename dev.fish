#!/usr/bin/env fish

bash concept2_scraper.sh

# add --refresh flag if a full rebuild is needed
python3 generate_post_embeddings.py

hugo server --gc -D --disableFastRender --buildFuture --ignoreCache
