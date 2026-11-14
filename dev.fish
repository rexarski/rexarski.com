#!/usr/bin/env fish

cd (status dirname)

# pass --refresh to rebuild the related-posts cache from scratch
./refresh.fish $argv

hugo server --gc -D --disableFastRender --buildFuture --ignoreCache
