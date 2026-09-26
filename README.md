# README

[![Netlify Status](https://api.netlify.com/api/v1/badges/7b30b16b-f3d1-43e2-abf5-c1708e515cbf/deploy-status)](https://app.netlify.com/sites/rexarski/deploys)

Made with

- [Hugo](https://gohugo.io/)
- [`hugo-bearblog` ʕ•ᴥ•ʔ](https://github.com/janraasch/hugo-bearblog) — theme, vendored as a git submodule; never edit it directly, override in `layouts/` instead
- [Atkinson Hyperlegible Next](https://www.brailleinstitute.org/freefont/), [JetBrains Mono](https://www.jetbrains.com/lp/mono/) — the only two webfonts, loaded from Google Fonts. Atkinson for everything that isn't mono, JetBrains Mono for code, dates, nav and small labels. Both are Latin-only, so **Chinese falls back to the system face** (PingFang SC on Apple, Microsoft YaHei on Windows, Noto Sans CJK elsewhere). That is deliberate: no serif, no CJK webfont.
- [neat-annotations](https://github.com/syabro/neat-annotations) — pure-CSS hand-drawn annotations, vendored at `assets/css/neat-annotations.css` (served locally, not from the CDN) and wrapped by the `ann` shortcode

## Where things live

- **Styles**: `assets/css/main.css`, published minified + fingerprinted by the `layouts/partials/style.html` override. Not in the theme, not an inline `<style>`.
- **Hand-edited data**: `data/now_current.yaml` / `data/now_history.yaml` (now page), `data/moments/<year>.yaml` (one file per year), `data/plates.yaml` (platespotting). Every date field is a quoted `"YYYY-MM-DD"` string — unquoted ones parse as YAML dates and sort inconsistently against the quoted ones.
- **Generated data**: `data/concept2_distance.json` (rowing progress bar on /now, from `concept2_scraper.sh`) and `data/related_posts.json` (相关博文，committed) are build inputs; `data/post_embeddings.json` is a gitignored local embedding cache.

## Layout

**Left-aligned, never centred.** `header` / `main` / `footer` share one shell — `width: min(100%, var(--page-max))` with `margin-inline: 0` — so the page hugs the left edge and wide screens spill their empty space to the right. Don't reintroduce `margin-inline: auto`.

Inside that shell, two columns: a left date rail (`--rail`, 168px, right-aligned, collapsing to 48px below 720px) and the main column. Every dated row on the site is a `.rail-row` — date in the rail, content in the main column. Page titles and prose sit in the main column too, so everything starts at the same x.

Type is carried by two families: **Atkinson Hyperlegible Next** for prose and headings, **JetBrains Mono** for dates, nav, the footer and small labels. Don't add a third — hierarchy is supposed to come from greyscale first and size second, and a display face quietly becomes a third signal competing with both. The scale is five tokens (`--fs-meta` → `--fs-h1`) plus `--fs-display` for date stamps and year labels. The accent (朱红 `--accent`) is deliberately rationed — logo spark, active nav item, link underlines, the blockquote quote mark, the lede's superscript ages, and the focus ring.

Relative times ("2 周前") are a progressive enhancement: the HTML ships the absolute date in `<time data-relative>`, and an inline script at the bottom of `baseof.html` rewrites it. Without JS the date is still there.

## Local dev

Just writing? This is enough — the committed data files cover everything:

```bash
hugo server --gc -D --disableFastRender --buildFuture
```

Full refresh (rowing data + related posts): run `./dev.fish`. The related-posts step (`generate_post_embeddings.py`) needs a local LM Studio server serving the model named in its `MODEL_NAME` constant (currently `text-embedding-embeddinggemma-300m-qat`); pass `--refresh` to rebuild the cache from scratch. Changing `MODEL_NAME` invalidates the cache on its own — the script notices and recomputes.

## Shortcodes

`toc`, `ann`, `tier` / `tierlist`, `plates`, `blog_heatmap`, `now_current` / `now_history`

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
