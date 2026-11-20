# Design

Layout, type and colour constraints for the site. Read this before touching `assets/css/main.css` or the layouts.

## Layout

**Left-aligned, never centred.** `header` / `main` / `footer` share one shell — `width: min(100%, var(--page-max))` with `margin-inline: 0` — so the page hugs the left edge and wide screens spill their empty space to the right. Don't reintroduce `margin-inline: auto`. `--page-max` is derived, not picked: two gutters plus one text column (`--content-width`, 580px). Nothing hangs outside that column, so there are exactly two edges: the logo, page titles, prose, row titles and the footer's copyright start on the left one; the nav, row dates and the footer's links end on the right one.

Every dated row on the site is a `.row` — content (`.row-main`) on the left edge, date (`.row-date`) on the right edge. The date comes first in the markup and the grid places it. Year headings (`.year-label`, with the group’s count across from them on the date edge) and the small group labels (`.section-label`: 最近写的, 相关, the month names) are plain blocks on the left edge. A post's date and tags sit on one line under its title (`.post-meta`). Sections are separated by space, not rules: the only hairline left is an author's own `---` inside prose (`content hr`).

The homepage heatmap (`partials/blog-heatmap.html`, tints of the accent, no legend or axis) ships two grids and shows one: weekly (53 cells) on desktop, monthly (12 cells) below 720px, swapped by `.by-week` / `.by-month`. Weekly cells fall to about 5px on a phone, which reads as texture rather than data. The monthly grid needs its own count buckets (0 / 1–2 / 3–4 / 5–7 / 8+), since a month's total runs well past the weekly scale.

The same layout holds on a phone: the date column is `auto`-sized, so nothing needs a breakpoint beyond a tighter gap and a smaller portrait.

/now renders its lists from `partials/now-current.html` and `partials/now-history.html` via `layouts/_default/now.html`, not from shortcodes: a shortcode runs inside `.Content`, and the lists are page-level blocks like the rows on /posts or /moments.

## Type

Two webfonts, both from Google Fonts: **Noto Sans SC** for prose and headings (it covers Latin and Simplified Chinese, so it carries every page on every platform), **IBM Plex Mono** for code, dates, nav, the footer and small labels (Plex has no CJK, so Chinese inside those falls through to Noto Sans SC). Don't add a third — hierarchy is supposed to come from greyscale first and size second, and a display face quietly becomes a third signal competing with both.

Two exceptions, both because Noto Sans SC draws curly quotes full-width: the blockquote's opening quote mark is set in Georgia, and the four glyphs `‘ ’ “ ”` come from a four-character subset of Source Sans 3 — the face Noto Sans SC's Latin is built on — placed first in `--font-body`, so `don’t` no longer splits. Chinese quoting uses 「」.

The scale is six tokens (`--fs-meta` → `--fs-h1`) plus `--fs-display` for page titles; in prose h2 > h3 > body, and h4 is body-sized bold. The root is 14px (`html { font-size: 87.5% }`), so the whole rem scale sits a step below the browser default; prose and UI share one body size (`--fs-body`). Code, kbd, tables and the TOC are sized in `em` so they follow the text around them; everything else takes its `font-size` from a token.

## Colour and surface

The site is light only — one palette on `:root` (white `#ffffff`, neutral greys, near-black `#111111`), no `prefers-color-scheme` block, no toggle, no theme JS. `color-scheme: light` on `:root` keeps native controls and neat-annotations' `light-dark()` on the same side. The background is flat: no texture, no dot grid, no entry animations.

The accent (朱红 `--accent`) is deliberately rationed — active nav item, link underlines, the blockquote quote mark, the heatmap and the focus ring. `<mark>` is the one second colour: a yellow highlight (`--mark-bg`). Dividers are plain `--border` hairlines, not dashed. Code blocks use Chroma's `github` style (`[markup.highlight]` in `config.toml`) on `--code-bg`.

Corners come in two radii, `--radius-sm` (2px: inline code, kbd, chips) and `--radius` (4px: images, code blocks); the homepage portrait is the only circle.

The styled RSS page (`static/pretty-feed.xsl`) is its own small world: the same left-hugging column, set entirely in the monospaced pixel face Fusion Pixel 12px (OFL, loaded from jsDelivr's Fontsource mirror), with every size a multiple of 12px.

## Identity

The 丘 seal. The header mark is a 20px SVG inlined in `layouts/partials/nav.html` and coloured by `--accent`. The homepage carries the portrait `static/images/rexarski.jpg` on the text's right edge, beside the latest moment (`.home-top`), linked to /about. Every post ends with the seal (`.end-seal` in `single.html`). The marks were brush-simulated once and committed as finished files; there is no generation script in the repo.

## JavaScript

Only two scripts: the relative-time script and the Umami tag in production. Relative times ("2 周前") are a progressive enhancement: the HTML ships the absolute date in `<time data-relative>`, and an inline script at the bottom of `baseof.html` rewrites it. Without JS the date is still there.
