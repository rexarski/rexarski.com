# rexarski.com

[![Netlify Status](https://api.netlify.com/api/v1/badges/7b30b16b-f3d1-43e2-abf5-c1708e515cbf/deploy-status)](https://app.netlify.com/sites/rexarski/deploys)

Made with

- [Hugo](https://gohugo.io/)
- [`hugo-bearblog` ʕ•ᴥ•ʔ](https://github.com/janraasch/hugo-bearblog)

## Note

- **Do NOT** use `blog`, `projects`, `zh` or any other tab names as tag names.

## Update theme as a submodule

```bash
git submodule update --remote --merge
```

## Token in `.env` file

```bash
echo ".env" >> .gitignore
echo 'NEODB_BEARER_TOKEN="*********"' > .env
```

## Local testing

```bash
hugo server --gc -D --disableFastRender --buildFuture
```

## Fetch latest NeoDB data

My go-to script for serve testing:

```bash
#!/bin/bash

# Load environment variables from .env file
source .env

# Run neodb_data.sh first
bash neodb_data.sh

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
