# README

[![Netlify Status](https://api.netlify.com/api/v1/badges/7b30b16b-f3d1-43e2-abf5-c1708e515cbf/deploy-status)](https://app.netlify.com/sites/rexarski/deploys)

Made with

- [Hugo](https://gohugo.io/)
- [`hugo-bearblog` ʕ•ᴥ•ʔ](https://github.com/janraasch/hugo-bearblog) — theme, vendored as a git submodule; never edit it directly, override in `layouts/` instead
- [Noto Sans SC](https://fonts.google.com/noto/specimen/Noto+Sans+SC), [IBM Plex Mono](https://fonts.google.com/specimen/IBM+Plex+Mono) — the only two webfonts, loaded from Google Fonts. Noto Sans SC covers both Latin and Simplified Chinese, so it carries every page on every platform; IBM Plex Mono handles code, dates, nav and small labels, and falls through to Noto Sans SC for the Chinese inside those (Plex has no CJK).
- [neat-annotations](https://github.com/syabro/neat-annotations) — pure-CSS hand-drawn annotations, vendored at `assets/css/neat-annotations.css` (served locally, not from the CDN) and wrapped by the `ann` shortcode

## Where things live

- **Styles**: `assets/css/main.css`, published minified + fingerprinted by the `layouts/partials/style.html` override. Not in the theme, not an inline `<style>`.
- **Hand-edited data**: `data/now_current.yaml` / `data/now_history.yaml` (now page), `data/moments/<year>.yaml` (one file per year), `data/plates.yaml` (platespotting). Every date field is a quoted `"YYYY-MM-DD"` string — unquoted ones parse as YAML dates and sort inconsistently against the quoted ones.
- **Generated data**: `data/concept2_distance.json` (rowing progress bar on /now, from `concept2_scraper.sh`) and `data/related_posts.json` (相关博文，committed) are build inputs; `data/post_embeddings.json` is a gitignored local embedding cache.

## Layout

**Left-aligned, never centred.** `header` / `main` / `footer` share one shell — `width: min(100%, var(--page-max))` with `margin-inline: 0` — so the page hugs the left edge and wide screens spill their empty space to the right. Don't reintroduce `margin-inline: auto`.

Inside that shell, two columns: a left date rail (`--rail`, 168px, right-aligned) and the main column. Every dated row on the site is a `.rail-row` — date in the rail, content in the main column. Page titles and prose sit in the main column too, so everything starts at the same x.

The /posts heatmap ships two grids and shows one: weekly (53 cells) on desktop, monthly (12 cells) below 720px, swapped by `.by-week` / `.by-month`. Weekly cells fall to about 5px on a phone, which reads as texture rather than data. The monthly grid needs its own count buckets (0 / 1–2 / 3–4 / 5–7 / 8+), since a month's total runs well past the weekly scale.

Below 720px the rail goes to 3.75rem, wide enough for the `MM-DD` most rows carry. The related-posts list is the one place that shows a full `YYYY-MM-DD`, so it overrides its own `grid-template-columns` to 5.25rem; without that the date runs under the title. Two kinds of row leave the grid entirely at that width and need their marker class in the template: `.rail-empty` for page heads and the tag cloud, and `.year-row` for the year headings on /posts and /moments (a year at `--fs-display` never fits the rail). The article header (`.post`) and the homepage hero stack for the same reason. Rows that *head* a group of dated rows — 上一个刹那, 最近写的, 相关, the month labels — deliberately keep the grid, so the label stays aligned with the content under it.

Type is carried by two families: **Noto Sans SC** for prose and headings, **IBM Plex Mono** for dates, nav, the footer and small labels. Don't add a third — hierarchy is supposed to come from greyscale first and size second, and a display face quietly becomes a third signal competing with both. The scale is five tokens (`--fs-meta` → `--fs-h1`) plus `--fs-display` for date stamps and year labels. The homepage date is the exception in form, not in face: `.today` is set vertically (`writing-mode: vertical-rl`) in Chinese numerals beside the lede, and lies down into one line below 720px. Hugo writes the build date as the fallback (`partials/cn-num.html`); the inline script rewrites it to today with the same numerals. The site is light only — one palette on `:root` (warm off-white `#f7f5f0`, warm near-black `#1c1a17`), no `prefers-color-scheme` block, no toggle, no theme JS. `color-scheme: light` on `:root` keeps native controls and neat-annotations' `light-dark()` on the same side. The background is flat: no texture, no dot grid, no entry animations. The accent (朱红 `--accent`) is deliberately rationed — active nav item, link underlines, the blockquote quote mark, the lede's superscript ages, and the focus ring. Dividers are plain `--border` hairlines, not dashed.

The only JavaScript left is the relative-time script below and the Umami tag in production. Relative times ("2 周前") are a progressive enhancement: the HTML ships the absolute date in `<time data-relative>`, and an inline script at the bottom of `baseof.html` rewrites it. Without JS the date is still there.

## Local dev

Just writing? This is enough — the committed data files cover everything:

```bash
hugo server --gc -D --disableFastRender --buildFuture
```

Full refresh (rowing data + related posts): run `./dev.fish`. The related-posts step (`generate_post_embeddings.py`) needs a local LM Studio server serving the model named in its `MODEL_NAME` constant (currently `text-embedding-embeddinggemma-300m-qat`); pass `--refresh` to rebuild the cache from scratch. Changing `MODEL_NAME` invalidates the cache on its own — the script notices and recomputes.

## Shortcodes

`toc`, `ann`, `tier` / `tierlist`, `plates`, `blog_heatmap`

/now renders its own lists from `partials/now-current.html` and `partials/now-history.html` via `layouts/_default/now.html`. They used to be shortcodes, but a shortcode runs inside `.Content`, which sits inside the page head's main column — so every `.rail-row` it emitted was indented one rail deeper than the same row on /posts or /moments.

## Conventions

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
