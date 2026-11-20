# README

[![Netlify Status](https://api.netlify.com/api/v1/badges/7b30b16b-f3d1-43e2-abf5-c1708e515cbf/deploy-status)](https://app.netlify.com/sites/rexarski/deploys)

Made with [Hugo](https://gohugo.io/), [Noto Sans SC](https://fonts.google.com/noto/specimen/Noto+Sans+SC) + [IBM Plex Mono](https://fonts.google.com/specimen/IBM+Plex+Mono), and [neat-annotations](https://github.com/syabro/neat-annotations) (vendored). Layout, type and colour rules: [`docs/design.md`](docs/design.md).

## Local dev

```bash
hugo server --gc -D --disableFastRender --buildFuture
```

- `./refresh.fish` regenerates `data/concept2_distance.json` and `data/related_posts.json`; run it after adding or editing posts and commit both files. It needs LM Studio; the embedding model is `MODEL_NAME` in `generate_post_embeddings.py`. `./refresh.fish --refresh` rebuilds the embedding cache.
- `./dev.fish` refreshes, then starts the server.
- Scripts and git hooks are fish; enable the hooks with `git config core.hooksPath .githooks`.

## Where things live

- `assets/css/main.css`: all styles (minified + fingerprinted by `layouts/partials/style.html`)
- `content/credo.md`: mottos, /credo/
- `content/toolbox.md`: /toolbox/
- `data/now_current.yaml`, `data/now_history.yaml`: /now
- `data/moments/<year>.yaml`: /moments, one file per year
- `data/plates.yaml`: /platespotting
- `data/concept2_distance.json`, `data/related_posts.json`: generated, committed; `data/post_embeddings.json` is a gitignored cache
- `static/favicon.svg`, `favicon.ico`, `apple-touch-icon.png`, `site.webmanifest`: browser icons (`layouts/partials/favicon.html`)
- `static/images/share.jpg`: share image; `static/images/logo/`: full logo set

Every date field is a quoted `"YYYY-MM-DD"` string: unquoted ones parse as YAML dates and sort inconsistently against the quoted ones.

## Shortcodes

`toc`, `ann`, `tier` / `tierlist`, `plates`

## Conventions

- **Do NOT** use `blog`, `projects`, `zh` or any other tab names as tag names.
- Link to another post:

  ```markdown
  [text]({{< ref "posts/yyyy-mm-dd-slug.md" >}})
  [text]({{< relref "yyyy-mm-dd-slug.md" >}})  <!-- same directory -->
  ```

- Big GIFs become looping MP4s, embedded as `<video src="…" autoplay loop muted playsinline></video>`:

  ```bash
  ffmpeg -i in.gif -movflags +faststart -pix_fmt yuv420p \
    -vf 'scale=trunc(iw/2)*2:trunc(ih/2)*2' -an out.mp4
  ```

- `HUGO_VERSION` in `netlify.toml` should match local `hugo version`; `.githooks/pre-commit` warns when they drift.

## Acknowledgements / 致谢

This site started from [hugo-bearblog](https://github.com/janraasch/hugo-bearblog) ʕ•ᴥ•ʔ by Jan Raasch (MIT). Every template has since been rewritten and the theme is no longer a dependency, but the bones are still bear-shaped. Thank you.

本站最初基于 Jan Raasch 的 [hugo-bearblog](https://github.com/janraasch/hugo-bearblog) ʕ•ᴥ•ʔ（MIT 协议）。如今模板已全部重写，也不再依赖这个主题，但骨架里还留着小熊的影子。谢谢。
