# rexarski.com

[![Netlify Status](https://api.netlify.com/api/v1/badges/7b30b16b-f3d1-43e2-abf5-c1708e515cbf/deploy-status)](https://app.netlify.com/sites/rexarski/deploys)

Made with

- [Hugo](https://gohugo.io/)
- [`hugo-bearblog` ʕ•ᴥ•ʔ](https://github.com/janraasch/hugo-bearblog)
- [Atkinson Hyperlegible Next](https://www.brailleinstitute.org/freefont/), [Fraunces](https://fonts.google.com/specimen/Fraunces), [Victor Mono](https://rubjo.github.io/victor-mono/)

## Note

- **Do NOT** use `blog`, `projects`, `zh` or any other tab names as tag names.

## Update theme as a submodule

```bash
git submodule update --remote --merge
```

## Local testing

```bash
hugo server --gc -D --disableFastRender --buildFuture
```

## Dev script

My go-to script for local development:

```bash
#!/bin/bash

# Run concept2_scraper.sh
bash concept2_scraper.sh

# Run generate_post_embeddings.py
# add a --refresh flag if a rebuild is needed
python3 generate_post_embeddings.py

# Then start hugo server
hugo server --gc -D --disableFastRender --buildFuture
```

## Refer to a previous blog post (with file path)

```markdown
# use ref
[text]({{< ref "posts/yyyy-mm-dd-slug.md" >}})
# use relref if both target and destination posts are in the same path
[text]({{< relref "yyyy-mm-dd-slug.md" >}})
```
