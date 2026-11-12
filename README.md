# README

[![Netlify Status](https://api.netlify.com/api/v1/badges/7b30b16b-f3d1-43e2-abf5-c1708e515cbf/deploy-status)](https://app.netlify.com/sites/rexarski/deploys)

Made with

- [Hugo](https://gohugo.io/)
- [Noto Sans SC](https://fonts.google.com/noto/specimen/Noto+Sans+SC), [IBM Plex Mono](https://fonts.google.com/specimen/IBM+Plex+Mono) — the only two webfonts, loaded from Google Fonts. Noto Sans SC covers both Latin and Simplified Chinese, so it carries every page on every platform; IBM Plex Mono handles code, dates, nav and small labels, and falls through to Noto Sans SC for the Chinese inside those (Plex has no CJK).
- [neat-annotations](https://github.com/syabro/neat-annotations) — pure-CSS hand-drawn annotations, vendored at `assets/css/neat-annotations.css` (served locally, not from the CDN) and wrapped by the `ann` shortcode

## Where things live

- **Styles**: `assets/css/main.css`, published minified + fingerprinted by `layouts/partials/style.html`. Not an inline `<style>`.
- **Hand-edited data**: `data/now_current.yaml` / `data/now_history.yaml` (now page), `data/moments/<year>.yaml` (one file per year), `data/plates.yaml` (platespotting). Every date field is a quoted `"YYYY-MM-DD"` string — unquoted ones parse as YAML dates and sort inconsistently against the quoted ones.
- **Generated data**: `data/concept2_distance.json` (rowing progress bar on /now, from `concept2_scraper.sh`) and `data/related_posts.json` (相关博文，committed) are build inputs; `data/post_embeddings.json` is a gitignored local embedding cache.
- **Identity**: the 丘 seal. Browser icons are `static/favicon.svg` / `favicon.ico` / `apple-touch-icon.png` / `site.webmanifest` (wired in `layouts/partials/favicon.html`), the header mark is a 20px SVG inlined in `layouts/partials/nav.html` and coloured by `--accent`, the share image is `static/images/share.jpg`, and the full logo set lives in `static/images/logo/`. The homepage carries the portrait `static/images/rexarski.jpg` on the text's right edge, beside the latest moment (`.home-top`), linked to /about. Every post ends with the seal (`.end-seal` in `single.html`). The marks were brush-simulated once and committed as finished files; there is no generation script in the repo.

## Layout

**Left-aligned, never centred.** `header` / `main` / `footer` share one shell — `width: min(100%, var(--page-max))` with `margin-inline: 0` — so the page hugs the left edge and wide screens spill their empty space to the right. Don't reintroduce `margin-inline: auto`. `--page-max` is derived, not picked: two gutters plus one text column (`--content-width`, 580px). Nothing hangs outside that column, so there are exactly two edges: the logo, page titles, prose, row titles and the footer's copyright start on the left one; the nav, row dates and the footer's links end on the right one.

Every dated row on the site is a `.row` — content (`.row-main`) on the left edge, date (`.row-date`) on the right edge. The date comes first in the markup and the grid places it. Year headings (`.year-label`, with the group’s count across from them on the date edge) and the small group labels (`.section-label`: 最近写的, 相关, the month names) are plain blocks on the left edge. A post's date and tags sit on one line under its title (`.post-meta`). Sections are separated by space, not rules: the only hairline left is an author's own `---` inside prose (`content hr`).

The homepage heatmap (`partials/blog-heatmap.html`, tints of the accent, no legend or axis) ships two grids and shows one: weekly (53 cells) on desktop, monthly (12 cells) below 720px, swapped by `.by-week` / `.by-month`. Weekly cells fall to about 5px on a phone, which reads as texture rather than data. The monthly grid needs its own count buckets (0 / 1–2 / 3–4 / 5–7 / 8+), since a month's total runs well past the weekly scale.

The same layout holds on a phone: the date column is `auto`-sized, so nothing needs a breakpoint beyond a tighter gap and a smaller portrait.

Type is carried by two families: **Noto Sans SC** for prose and headings, **IBM Plex Mono** for dates, nav, the footer and small labels. Don't add a third — hierarchy is supposed to come from greyscale first and size second, and a display face quietly becomes a third signal competing with both. (Two exceptions, both because Noto Sans SC draws curly quotes full-width: the blockquote's opening quote mark is set in Georgia, and the four glyphs `‘ ’ “ ”` come from a four-character subset of Source Sans 3 — the face Noto Sans SC's Latin is built on — placed first in `--font-body`, so `don’t` no longer splits. Chinese quoting uses 「」.) The scale is six tokens (`--fs-meta` → `--fs-h1`) plus `--fs-display` for page titles; in prose h2 > h3 > body, and h4 is body-sized bold. The root is 14px (`html { font-size: 87.5% }`), so the whole rem scale sits a step below the browser default; prose and UI share one body size (`--fs-body`). Code, kbd, tables and the TOC are sized in `em` so they follow the text around them; everything else takes its `font-size` from a token. The site is light only — one palette on `:root` (white `#ffffff`, neutral greys, near-black `#111111`), no `prefers-color-scheme` block, no toggle, no theme JS. Code blocks use Chroma's `github` style (`[markup.highlight]` in `config.toml`) on `--code-bg`. `<mark>` is the one second colour: a yellow highlight (`--mark-bg`). Corners come in two radii, `--radius-sm` (2px: inline code, kbd, chips) and `--radius` (4px: images, code blocks); the homepage portrait is the only circle. The styled RSS page (`static/pretty-feed.xsl`) is its own small world: the same left-hugging column, set entirely in the monospaced pixel face Fusion Pixel 12px (OFL, loaded from jsDelivr's Fontsource mirror), with every size a multiple of 12px. `color-scheme: light` on `:root` keeps native controls and neat-annotations' `light-dark()` on the same side. The background is flat: no texture, no dot grid, no entry animations. The accent (朱红 `--accent`) is deliberately rationed — active nav item, link underlines, the blockquote quote mark, the heatmap and the focus ring. Dividers are plain `--border` hairlines, not dashed.

The only JavaScript left is the relative-time script below and the Umami tag in production. Relative times ("2 周前") are a progressive enhancement: the HTML ships the absolute date in `<time data-relative>`, and an inline script at the bottom of `baseof.html` rewrites it. Without JS the date is still there.

## Local dev

Just writing? This is enough — the committed data files cover everything:

```bash
hugo server --gc -D --disableFastRender --buildFuture
```

Full refresh (rowing data + related posts): run `./dev.fish`. The related-posts step (`generate_post_embeddings.py`) needs a local LM Studio server serving the model named in its `MODEL_NAME` constant (currently `text-embedding-embeddinggemma-300m-qat`); pass `--refresh` to rebuild the cache from scratch. Changing `MODEL_NAME` invalidates the cache on its own — the script notices and recomputes.

## Shortcodes

`toc`, `ann`, `tier` / `tierlist`, `plates`

/now renders its own lists from `partials/now-current.html` and `partials/now-history.html` via `layouts/_default/now.html`. They used to be shortcodes, but a shortcode runs inside `.Content`, and the lists are page-level blocks like the rows on /posts or /moments, so they stay in the layout.

## Conventions

- **Do NOT** use `blog`, `projects`, `zh` or any other tab names as tag names.
- Big GIFs become looping MP4s, embedded as `<video src="…" autoplay loop muted playsinline></video>`:

  ```bash
  ffmpeg -i in.gif -movflags +faststart -pix_fmt yuv420p \
    -vf 'scale=trunc(iw/2)*2:trunc(ih/2)*2' -an out.mp4
  ```

- Netlify builds with the Hugo version pinned in `netlify.toml` (`HUGO_VERSION`), which should match local `hugo version`. `.githooks/pre-commit` prints a warning when they drift (it never blocks the commit); fix it by bumping the pin.

## Refer to a previous blog post (with file path)

```markdown
# use ref
[text]({{< ref "posts/yyyy-mm-dd-slug.md" >}})
# use relref if both target and destination posts are in the same path
[text]({{< relref "yyyy-mm-dd-slug.md" >}})
```

## Acknowledgements / 致谢

This site started from [hugo-bearblog](https://github.com/janraasch/hugo-bearblog) ʕ•ᴥ•ʔ by Jan Raasch (MIT). Every template has since been rewritten and the theme is no longer a dependency, but the bones are still bear-shaped. Thank you.

本站最初基于 Jan Raasch 的 [hugo-bearblog](https://github.com/janraasch/hugo-bearblog) ʕ•ᴥ•ʔ（MIT 协议）。如今模板已全部重写，也不再依赖这个主题，但骨架里还留着小熊的影子。谢谢。
