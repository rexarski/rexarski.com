# CLAUDE.md

Personal Hugo blog. Architecture, layout, styling and the data-file formats are documented in `README.md`; read that first. This file only records how day-to-day edits are expected to go.

## Communication

- Reply in Chinese. Keep technical terms, file names and commands in English as written.
- Entry text I dictate goes into the file **verbatim**: no polishing, no case changes, no added punctuation. If you have a better wording, suggest it in the reply; the file keeps my words.
- "昨天" / "前天" are resolved against today's date into `YYYY-MM-DD`; with no date given, use today. If the session crosses midnight and the day is ambiguous, use the current date and say so in one line.

## Routine content edits

### 当下 (/now)

- Add: insert `start` + `text` at the top of `items:` in `data/now_current.yaml`. Double-quote `text` when it contains a markdown link or an ASCII colon.
- Archive ("结束了", "看完了", "放到 history"): cut the entry from `now_current.yaml`, add an `end` field, paste it at the top of `items:` in `data/now_history.yaml`. **Do not touch `text` when archiving.**
- Whether two entries overlap or wording should be unified is my call: point it out, never merge or rewrite on your own.

### 刹那 (/moments)

- One file per year, `data/moments/<year>.yaml`; new entries go at the top (list runs newest → oldest).
- Fields: `date`, `type`, `title`, optional `note`, `url`. `type` is a preset name from the file's header comment (`show`, `book`, `baby`, …) or a single emoji.
- `title` carries the main sentence, `note` the commentary. TV seasons are written as `Title S01`.
- If I give no emoji, pick one, but say in the reply that it was your choice.

### Platespotting

- Append to the end of `data/plates.yaml`; the template sorts alphabetically at render time.
- Write `meaning` only when I supply one. Never guess a meaning into the file; offer it in the reply instead.

### Toolbox

- A single page, `content/toolbox.md`, rendered at `/toolbox/`. There is no section directory and no list template any more; old sub-page URLs 301 to `/toolbox/` via `netlify.toml`.
- Heading levels: `##` per topic (基调和实操 / 软件 / 字体 / KOReader / 文本), `###` beneath, `####` for the numbered setup steps. `markup.tableOfContents.endLevel = 3` in `config.toml` keeps the page TOC to `##`/`###`, so the 15 steps stay out of it on purpose.
- 软件: the active list sits under `## 软件`, the retired list under `### 归档`. Insert into 归档 alphabetically. Both lists end with a `{.app-grid}` line (Goldmark block attribute, enabled in `config.toml`) that lays them out as a multi-column grid via `content ul.app-grid` in `main.css`; keep that line last and add new items above it.
- 基调和实操: the brew setup script lives here. After adding or removing software, update the script and set the `updated on` line in that section to today. Verify cask names with `brew info --cask`; tapped packages use the full `user/tap/name`.
- When reconciling against this machine (`brew list --formula --installed-on-request`, `brew list --cask`), font casks belong under `## 字体`, not in the script.
- Cross-references within the page are fragment links (`#字体`), not paths.

### Other

- The mottos in `content/about.md` are a list; new ones are appended at the end.
- Every date field is a quoted `"YYYY-MM-DD"` string (README explains why).

## Verification

- After editing data files, build into the scratchpad directory rather than the repo's `public/`:
  `hugo --quiet -d <scratchpad>/public`, then grep the rendered page to confirm the entry landed where expected (an archived now item should vanish from the homepage and appear under 回顾 on /now).
- Pure text substitutions do not need a rebuild.

## Git

- Commit only when I say "commit"; push only when I say "push". "draft commit message" means draft it in the reply and stop.
- Check `git status` and `git log --oneline -3` first. I sometimes commit myself mid-session; do not describe already-committed work in a new message.
- Messages follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/):

  ```
  <type>(<scope>): <summary>

  - <detail>
  - <detail>
  ```

  - `type`: `feat` (new site capability), `fix`, `refactor`, `style` (visual/CSS only), `docs` (README, CLAUDE.md), `chore` (everything else, including all routine content updates). Append `!` after the scope for a breaking change, e.g. `refactor(site)!:`.
  - `scope`: `content` for data/content edits, `home`, `site`, `toolbox`, `css`, or the area touched. Keep it to one word.
  - `summary`: imperative, lowercase start, no trailing period, ≤ 72 characters. Chinese page names (当下, 刹那) are fine inside it, matching the repo history.
  - Body: a `-` bullet per area, in the order now / moments / plates / toolbox / about. One commit per batch of content updates; a toolbox script change may ride along with content.
- Commits are SSH-signed through 1Password. If signing fails from your shell with `1Password: failed to fill whole buffer`, write the message to `.git/COMMIT_MSG_DRAFT` and ask me to run, at the very start of the input line,
  `! git commit -F .git/COMMIT_MSG_DRAFT && git push`
  (keep the path short; long paths get wrapped and break). Delete the draft file afterwards.
- Work directly on `main`; no branches for content updates.
- Never edit the `themes/` submodule; never commit `public/`.
