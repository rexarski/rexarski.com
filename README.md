# README

[![Netlify Status](https://api.netlify.com/api/v1/badges/7b30b16b-f3d1-43e2-abf5-c1708e515cbf/deploy-status)](https://app.netlify.com/sites/rexarski/deploys)

Made with

- [Hugo](https://gohugo.io/)
- [`hugo-bearblog` ʕ•ᴥ•ʔ](https://github.com/janraasch/hugo-bearblog) — theme, vendored as a git submodule; never edit it directly, override in `layouts/` instead
- [Atkinson Hyperlegible Next](https://www.brailleinstitute.org/freefont/), [Fraunces](https://fonts.google.com/specimen/Fraunces), [JetBrains Mono](https://www.jetbrains.com/lp/mono/) — loaded from Google Fonts, weights 400–700 only
- [neat-annotations](https://github.com/syabro/neat-annotations) — pure-CSS hand-drawn annotations, vendored at `assets/css/neat-annotations.css` (served locally, not from the CDN) and wrapped by the `ann` shortcode

## Where things live

- **Styles**: `assets/css/main.css`, published minified + fingerprinted by the `layouts/partials/style.html` override. Not in the theme, not an inline `<style>`.
- **Hand-edited data**: `data/now_current.yaml` / `data/now_history.yaml` (now page), `data/moments/<year>.yaml` (one file per year), `data/plates.yaml` (platespotting).
- **Generated data**: `data/concept2_distance.json` (rowing progress bar on /now, from `concept2_scraper.sh`) and `data/related_posts.json` (相关博文, committed) are build inputs; `data/post_embeddings.json` is a gitignored local embedding cache.

## Local dev

Just writing? This is enough — the committed data files cover everything:

```bash
hugo server --gc -D --disableFastRender --buildFuture
```

Full refresh (rowing data + related posts): run `./dev.fish`. The related-posts step (`generate_post_embeddings.py`) needs a local LM Studio server with an embeddings model loaded; pass `--refresh` to rebuild the cache from scratch.

## Shortcodes

`toc`, `postslist`, `ann`, `tier` / `tierlist`, `plates`, `blog_heatmap`, `now_current` / `now_history` / `now_progress_bars`

## Conventions

- Look-affecting changes get a Mandarin entry in `content/changelog.md`.
- **Do NOT** use `blog`, `projects`, `zh` or any other tab names as tag names.
- Big GIFs become looping MP4s, embedded as `<video src="…" autoplay loop muted playsinline></video>`:

  ```bash
  ffmpeg -i in.gif -movflags +faststart -pix_fmt yuv420p \
    -vf 'scale=trunc(iw/2)*2:trunc(ih/2)*2' -an out.mp4
  ```

- Netlify builds with the Hugo version pinned in `netlify.toml` (0.160.1); local Hugo may be newer, so bump the pin before relying on a newer template feature.

## Update theme as a submodule

```bash
git submodule update --remote --merge
```

## Refer to a previous blog post (with file path)

```markdown
# use ref
[text]({{< ref "posts/yyyy-mm-dd-slug.md" >}})
# use relref if both target and destination posts are in the same path
[text]({{< relref "yyyy-mm-dd-slug.md" >}})
```
