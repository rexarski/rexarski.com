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
