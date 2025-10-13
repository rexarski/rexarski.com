+++
title = "rexarski's toolbox"
menu = "not on main"
+++

# rexarski's toolbox

{{< toc >}}

> A not-so-minimal setup guide.

## Todos

- Set up iCloud account.
- Install **[1Password](https://1password.com/)**. THE password manager for the last decade. Requires yearly subscription. `Cmd` + `Option` + `P`: Open 1Password 🔁
- Install [Maestral](https://maestral.app/). Open source Dropbox client, simpler, smaller, less memory needed. `brew install --cask maestral` 🍺
- Install **[iTerm 2](https://iterm2.com/)**. Terminal, but better than Terminal.
  - Snazzy theme: `(curl -Ls https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors > /tmp/Snazzy.itermcolors && open /tmp/Snazzy.itermcolors)`
  - [fish](https://fishshell.com/). The friendly interactive shell.
    - Follow this [gist](https://gist.github.com/gagarine/cf3f65f9be6aa0e105b184376f765262) to set `fish` as default
- Install **[Homebrew](https://brew.sh/)**. THE package manager for macOS. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
  - `asciinema`
  - `bat` <- `cat`
  - `btop` <- `htop` and `top`
  - **`emacs`**
  - `exiftool`
  - `eza` <- `ls` and `exa`
  - `fx`
  - `fzf`
  - `jq`
  - `neofetch`
  - `neovim` <- `vim`
  - `procs` <- `ps`
  - `scc`
  - `tldr`
  - `tre` (`brew install tre-command`) <- `tree`
  - `tmux`
  - **`uv`**
  - `vizdata`
  - `you-get`
- [Change computer and host name](https://apple.stackexchange.com/questions/66611/how-to-change-computer-name-so-terminal-displays-it-in-mac-os-x-mountain-lion):
  - `sudo scutil --set ComputerName "newname"`
  - `sudo scutil --set LocalHostName "newname"`
  - `sudo scutil --set HostName "newname"`
- Stop Time Machine local snapshots. `tmutil disablelocal` was deprecated since Mojave. Use  [TimeMachineEditor](https://tclementdev.com/timemachineeditor/) instead.
- Create a global `gitignore` file at `~/.gitignore`. See [this one](/config/.gitignore) as an example: `git config --global core.excludesfile ~/.gitignore`
- Generate and add SSH key to GitHub account.
- ~~Turn off the Spotlight.~~ Set Spotlight shortcut to Option + Space.
- Turn off the auto boot feature (if this is a MacBook.) `sudo nvram AutoBoot=%00`. Turn it back on by `sudo nvram AutoBoot=%03` or use `nvram -p` to check the current value.
- Generate and add SSH key to GitHub account.
- In Safari, go to Preferences - Advanced, turn on "Show Develop menu in menu bar".

## Application list

### A

- [Adobe Digital Editions](https://www.adobe.com/solutions/ebook/digital-editions/download.html). For downloading and reading Kobo epub.
- [Affinity Designer 2](https://affinity.serif.com/en-us/designer/). 🎫
- [Affinity Photo 2](https://affinity.serif.com/en-us/photo/). 🎫
- [Affinity Publisher 2](https://affinity.serif.com/en-us/publisher/). 🎫
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12). Keep the machine awake. `Cmd` + `Shift` + `A`: turn on/off 
- [Anki](https://apps.ankiweb.net/)
- [Antinote](https://antinote.io/). 🎫
  - ⌥ + A to toggle it.
- Anybox. 
- [Applite](https://github.com/milanvarady/Applite), user-friendly GUI macOS application for Homebrew Casks. `brew install --cask applite` 🍺
- [Aseprite](https://www.aseprite.org/). A animated pixel art editor. Purchased on [Steam](https://store.steampowered.com/app/431730/Aseprite/). 🎫

### B

- [BetterTouchTool](https://folivora.ai), input (not only trackpad!) customization. 🎫
  - All apps
    - rotate right = volume up
    - rotate left = volume down
    - 2 fingers tap = mission control
    - 2 fingers click = play/pause
    - 3 fingers tap = command + w
    - 3 fingers click = close window under cursor
    - 3 fingers pinch in = command +shift + 4 = shottr active window screenshot
    - 4 fingers tap = minimize window under cursor
    - 4 fingers click = quit app under cursor
    - 5 fingers tap = application expose
  - Preview
    - 2 fingers swipe right = rotate right
    - 2 fingers swipe left = rotate left
- [Buckets](https://www.budgetwithbuckets.com/) 🎫
- [bun](https://bun.sh/) `curl -fsSL https://bun.sh/install | bash`

### C

- [calibre](https://calibre-ebook.com/). E-book management. `brew install --cask calibre` 🍺
  - [calibre-douban](https://github.com/fugary/calibre-douban). 豆瓣插件.
  - [Fix Kindle Ebook Cover](https://github.com/bookfere/Fix-Kindle-Ebook-Cover). A tool to fix damaged cover for Kindle.
  - [Kindle Previewer](https://www.amazon.com/Kindle-Previewer/b?ie=UTF8&node=21381691011)
  - [Kindle Comic Converter](https://github.com/ciromattia/kcc). 🍺
  - EpubCheck
  - Kobo Metadata
  - New Douban Books
  - [GitHub - noDRM/DeDRM\_tools: DeDRM tools for ebooks](https://github.com/noDRM/DeDRM_tools)
  - Highlights to Obsidian
  - Obok DeDRM
- [Cursor](https://cursor.com/en)

### D

- [DaisyDisk](https://daisydiskapp.com/). Disk usage in a wind rose diagram. 
- [Datasette](https://datasette.io/). A tool for exploring and publishing data.
- [Deliveries](https://deliveries.app/en.html). 
- [DEVONthink 4](https://www.devontechnologies.com/apps/devonthink) 🎫
- [Discord](https://discord.com/). `brew install --cask discord` 🍺
- [Downie](https://software.charliemonroe.net/downie/) 🎫
- [Drafts](https://getdrafts.com/). For drafting. 🔁
  - `Cmd` + `Shift` + `1` = Drafts main window
  - `Cmd` + `Shift` + `2` = Drafts quick entry
- **[Due](https://www.dueapp.com/)**. Aggressive reminder. 🔁.

### E

- [Eagle](https://eagle.cool/). Organize images. 🎫

### F

- [Final Cut Pro](https://www.apple.com/final-cut-pro/). 
  - [Motion](https://www.apple.com/final-cut-pro/motion/). 
  - [Compressor](https://www.apple.com/final-cut-pro/compressor/). 
- [Flighty](https://apps.apple.com/us/app/flighty-live-flight-tracker/id1358823008). 
- [Fujifilm X RAW Studio](https://fujifilm-x.com/en-us/support/download/software/x-raw-studio/).

### G

- [Gemini](https://macpaw.com/gemini). Duplicate finder. 🎫
- [GitHub Desktop](https://desktop.github.com/). Easy-to-use Git GUI.
- [GoodLinks](https://apps.apple.com/us/app/goodlinks/id1474335294). 

### H

- [Handbrake](https://handbrake.fr). Open source video transcoder. `brew install —cask handbrake` 🍺
  - iPod 5.5 gen - 7 gen compatible video preset: [github](https://github.com/HandBrake/HandBrake/issues/4040), [reddit discussion](https://www.reddit.com/r/ipod/comments/jccdm1/guide_to_ipod_classic_and_nano_video_formats/)

### I

- [iA Writer](https://ia.net/writer)
- [Ice](https://github.com/jordanbaird/Ice). Bartender alternative. `brew install --cask jordanbaird-ice` 🍺
- [IINA](https://iina.io/). Media player. `brew install --cask iina` 🍺
- [Ivory for Mastodon](https://tapbots.com/ivory/mac/). 🔁

### K

- [Karabiner Elements](https://karabiner-elements.pqrs.org/). Key mapping customizer.
  - `Hyper` == `Cmd + Ctrl + Option + Shift`
  - `Shift` + `Backspace`: Forward delete
  - Complex modifications: [Change `caps_lock` to `Cmd + Ctrl + Option + Shift`](https://ke-complex-modifications.pqrs.org/#modifier-keys).
- [Keka](https://www.keka.io/en/) `brew install --cask keka` 🍺
- [KeyClu](https://sergii.tatarenkov.name/keyclu/support/). Cheatsheet alternative
  - Double press cmd and hold to activate the cheatsheet.
  - Double press cmd and quick release to activate Siri.
  - `brew install —cask keyclu` 🍺

### L

- [Latest](https://github.com/mangerlahn/Latest). Checks applications' latest update on macOS.
 `brew install --cask latest` 🍺
- [LocalSend](https://localsend.org). File transfer between Android and other devices.
- [Loop](https://github.com/MrKai77/Loop). Alternative to Moom.
  - Left `Ctrl` to activate a selector ring.
  - `brew install --cask loop` 🍺
- [Lunar](https://lunar.fyi/)

### M

- [**mac-cleanup-py**](https://github.com/mac-cleanup/mac-cleanup-py) clean up script for macos. `brew tap mac-cleanup/mac-cleanup-py; brew install mac-cleanup-py` 🍺
- [Marked 2](https://marked2app.com/) 🎫
- [`monolith`](https://github.com/Y2Z/monolith).`brew install monolith` 🍺
- [MultiViewer for F1](https://beta.f1mv.com/)
- [Musicbrainz Picard](https://picard.musicbrainz.org/)
- [MusicBox](https://apps.apple.com/us/app/musicbox-save-music-for-later/id1614730313). Bookmark music. 
- [MusicHarbor](https://apps.apple.com/cn/app/musicharbor-new-music-tracker/id1440405750). 

### N

- [Nicotine+](https://nicotine-plus.org), a graphical client for Soulseek.

### O

- **[Obsidian](https://obsidian.md/)**. Second brain/digital garden/Zettelkasten. Go subscribe to [Obsidian Sync](https://obsidian.md/sync) to support the development!
- [Obsidian Web Clipper](https://stephango.com/obsidian-web-clipper). 
  - option + shift + O: Open Obsidian Clipper
  - option + shift + T: Toggle highlights with Obsidian Clipper
- [Ollama](https://github.com/jmorganca/ollama). LocalLLM.
- [OrbStack](https://orbstack.dev/). A light-weight Docker and Linux runtime management. `brew install --cask orbstack` 🍺

### P

- [PasteBot](https://tapbots.com/pastebot/) 🎫
- [PCalc](https://pcalc.com/) 
- [PDF Expert](https://pdfexpert.com/) 🎫
- [Pearcleaner](https://github.com/alienator88/Pearcleaner). A free, source-available and fair-code licensed mac app cleaner. `brew install pearcleaner` 🍺
- [Permute 3](https://software.charliemonroe.net/permute/) 🎫
- [PhotoBulk](https://photobulkeditor.com/). Quick photo editor. 
- [PICO-8](https://www.lexaloffle.com/pico-8.php). Fantasy retro console game engine. 🎫
- [Picotron](https://www.lexaloffle.com/picotron.php). A fantasy workstation. 🎫
- [Play](https://apps.apple.com/cn/app/play-save-videos-watch-later/id1596506190). Watch it later(s). 
- [Plex](https://www.plex.tv/). `brew install --cask plex` 🍺
- [Positron](https://positron.posit.co/)

### Q

- [Quarto](https://quarto.org/). An open source scientific and technical publishing system built on Pandoc. `brew install --cask quarto` 🍺

### R

- [R](https://www.r-project.org/).
- [Reeder](https://reeder.app) 🔁.
- [Raycast](https://www.raycast.com/). Extendable launcher substitute to Spotlight, with an extension store. `Cmd` + `Space`: Activate Raycast. `brew install --cask raycast` 🍺
- [Rocket](https://matthewpalmer.net/rocket/). Emoji launcher with one-key shortcut. Use `:` to trigger the app. 🎫

### S

- [Shareful](https://sindresorhus.com/shareful). 
- [Shottr](https://shottr.cc/). Great substitute to CleanShot X. 🎫
  - `Cmd` + `Shift` + `3` = Shottr area screenshot
  - `Cmd` + `Shift` + `4` = Shottr active window screenshot
  - `Cmd` + `Shift` + `5` = Shottr fullscreen screenshot
- [Sink it for Reddit](https://apps.apple.com/us/app/sink-it-for-reddit/id6449873635). 
- [skim](https://skim-app.sourceforge.io/). PDF viewer. `brew install --cask skim` 🍺
- [Sleeve 2](https://replay.software/sleeve). 🎫
- [Steam](https://store.steampowered.com/)

### T

- [Tapestry](https://usetapestry.com/). A unified and chronological timeline of blogs and social media. 
- [Telegram](https://telegram.org/). `brew install --cask telegram` 🍺
- **[Things 3](https://culturedcode.com/things/)**. The best GTD. 
  - `Ctrl` + `Space`: quick entry.
  - `Hyper` + `T`: quick entry with autofill. This requires [Things Helper](https://culturedcode.com/things/help/things-sandboxing-helper-things3/).
- [TimeMachineEditor](https://tclementdev.com/timemachineeditor/). Manually control Time Machine backup schedule. `brew install --cask timemachineeditor` 🍺
- [Transmission](https://transmissionbt.com) `brew install --cask transmission` 🍺

### U

- [undercut-f1](https://github.com/JustAman62/undercut-f1). F1 Live Timing TUI for all F1 sessions with variable delay to sync to your TV.
- [uBlock Origin Lite](https://apps.apple.com/us/app/ublock-origin-lite/id6745342698). 
- [upic](https://github.com/gee1k/uPic). Image (and small file) upload tool for macOS. `brew install bigwig-club/brew/upic --cask` 🍺

### W

- [微信 WeChat](https://www.wechat.com/). `brew install --cask wechat` 🍺

### X

- [Xcode](https://developer.apple.com/xcode/). 
- [xld](https://tmkk.undo.jp/xld/index_e.html). Lossless audio decoder for macOS.

### Y

- [YACReader](https://www.yacreader.com/) `brew install --cask yacreader`. 🍺

### Z

- **[Zed](https://zed.dev/)**. Might be better than VSC. `brew install --cask zed` 🍺
- [Zen Browser](https://zen-browser.app). Might be better than Firefox. Plugins associated with Firefox should be synced.

## Font selections

- [Lexend](https://www.lexend.com/), sans-serif
- Roboto family
  - [Roboto](https://fonts.google.com/specimen/Roboto), sans-serif
  - [Roboto Condensed](https://fonts.google.com/specimen/Roboto+Condensed), sans-serif
  - [Roboto Serif](https://fonts.google.com/specimen/Roboto+Serif), serif
  - [Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono), monospace
- [IBM 3270](https://github.com/rbanffy/3270font), monospace
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/), monospace
- [Ubuntu Monospace](https://design.ubuntu.com/font/), monospace
- [Noto Mono for Powerline](https://github.com/powerline/fonts/), monospace
- Amazon Ember and Bookerly from [Amazon Complete Font Set](https://developer.amazon.com/en-US/alexa/branding/echo-guidelines/identity-guidelines/typography), sans serif, serif
- [LXGW WenKai / 霞鹜文楷](https://github.com/lxgw/LxgwWenKai), serif
- [LXGW Neo XiHei / 霞鹜新晰黑](https://github.com/lxgw/LxgwNeoXiHei), sans-serif
- [喜鹊宋体](https://xiquezaozi.taobao.com/), serif
- [Atkinson Hyperlegible](https://brailleinstitute.org/freefont), sans-serif
- [Charis SIL](https://software.sil.org/charis/), serif
- [Server Mono](https://servermono.com/), monospace

***

## Archive

<details>

<summary>For those applications/packages that are not in use.</summary>

- [AlDente](https://github.com/davidwernhart/AlDente) 🎫
- [Alfred](https://www.alfredapp.com/) `Option` + `Space`: Activate Aflred search bar. 🎫
- [Anaconda](https://www.anaconda.com/)
  - `conda config —set auto_activate_base false`. [Do not activate `conda` by default](https://stackoverflow.com/questions/54429210/how-do-i-prevent-conda-from-activating-the-base-environment-by-default).
- [Android File Transfer](https://www.android.com/filetransfer/)
- [Audacity](https://www.audacityteam.org/)
- [Beekeeper Studio Community Edition](https://github.com/beekeeper-studio/beekeeper-studio)
- [BetterDisplay](https://github.com/waydabber/BetterDisplay#readme). Display customization tool. From the same developer of [Monitor Control](https://github.com/MonitorControl/MonitorControl). 🎫
- [Brooklyn](https://github.com/pedrommcarrasco/Brooklyn). Screensaver inspired by Apple's Event on October 30, 2018.
- [Calendr](https://github.com/pakerwreah/Calendr). Menu bar calendar.
- [coconutBattery](https://coconut-flavour.com/coconutbattery/)
- [Concept2 Utility](https://www.concept2.com/support/software/utility)
- [Dark Noise](https://darknoise.app/) 
- [Darkroom](https://darkroom.co/) 🎫
- [Day One](https://dayoneapp.com/). 🔁
- [DockDoor](https://dockdoor.net/). `brew install --cask dockdoor` 🍺
- [Fantastical](https://flexibits.com/fantastical) `Hyper +`F`: create new event/reminder 🎫
- [Figma](https://www.figma.com/)
- [Fliqlo Flip Clock](https://fliqlo.com/). The classic screensaver.
- [fruit](https://github.com/Corkscrews/fruit). Retro Apple screensaver.
- Ghostty. `brew install —cask ghostty`
- [Hush](https://github.com/oblador/hush). Content blocker for Safari. 
- [iMazing 3](https://imazing.com/) 🎫
- [Itsycal for Mac](https://www.mowglii.com/itsycal/)
- [julia](https://julialang.org/) `brew install --cask julia` 🍺
- [Keepa](https://keepa.com/#). Amazon price tracker. 
- [KeyCastr](https://github.com/keycastr/keycastr) `Hyper` + `K`: Toggle capturing
- [Klack](https://tryklack.com/). Fun app with keyboard sound. 
- [Logi Options+](https://www.logitech.com/en-us/software/logi-options-plus.html). Customize Logitech peripherals.
- [Maccy](https://maccy.app/). Clipboard. `brew install --cask maccy` 🍺
- [Mactracker](https://mactracker.ca/) 
- [MiaoYan 妙言](https://github.com/tw93/MiaoYan/)
- [Min Browser](https://github.com/minbrowser/min). `brew install --cask min` 🍺
- [Moom](https://manytricks.com/moom/) `Cmd` + `Option` + `M`: toggle Moom keyboard control. 🎫
- [NetNewsWire](https://ranchero.com/netnewswire/). For RSS. `brew instlal --cask netnewswire` 🍺
- [Numi](https://numi.app/). NLP + calculator. `brew install --cask numi` 🍺
- [OpenEmu](https://github.com/OpenEmu/OpenEmu).
- [Parcel](https://apps.apple.com/us/app/parcel-delivery-tracking/id639968404?mt=12). Track your packages. 
- [Pictogram](https://pictogramapp.com/). Only to replace Zen Browser and X Raw Studios' icons.
- [Pins](https://get-pins.app/) 
- [Plain Text Editor](https://apps.apple.com/us/app/plain-text-editor/id1572202501?mt=12). 
- [Pocket Casts](https://pocketcasts.com/) 🎫
- [Processing](https://processing.org/)
- [QLMarkdown](https://github.com/sbarex/QLMarkdown). macOS Quick Look extension for markdown files. `brew install --cask qlmarkdown` 🍺
- [Quitter](https://marco.org/apps)
- [Reeder 5 -> Reeder Classic](https://reederapp.com/). 
- [Reminders Menubar](https://github.com/DamascenoRafael/reminders-menubar) `brew install --cask reminders-menubar` 🍺]
- [RIME | 中州韵输入法](https://rime.im/). "Rime Input Method Engine, rimes with your keystrokes."
  - [东风破](https://github.com/rime/plum)
  - [雾凇拼音](https://github.com/iDvel/rime-ice): `bash rime-install iDvel/rime-ice:others/recipes/full`
- [RStudio](https://www.rstudio.com/). IDE for R.
- [Scratchpad](https://apps.apple.com/us/app/scratchpad/id6504040051). 
- [SD Card Formatter](https://www.sdcard.org/downloads/formatter/).
- [Sequel](https://www.getsequel.app/). Keep track of the movies, shows, games, books and audiobooks. 
- [Spotify](https://open.spotify.com/)
- [Stats](https://github.com/exelban/stats). System monitor in menu bar. `brew install --cask stats` 🍺
- [SynologyAssistant](https://www.synology.com/en-us/support/download).
- [Synology Drive Client](https://kb.synology.com/en-us/DSM/help/SynologyDriveClient/synologydriveclient?version=7)
- [Take a break](https://apps.apple.com/us/app/take-a-break-timer-reminder/id1457158844?mt=12). 
- [texifier](https://www.texifier.com/) 🎫
- [Transmit](https://panic.com/transmit/) 🎫
- [Visual Studio Code](https://code.visualstudio.com/). `brew install --cask visual-studio-code` 🍺
- [VLC](https://www.videolan.org/) `brew install --cask vlc` 🍺
- [Yoink](https://eternalstorms.at/yoink/mac/) 
- [Zoom](https://zoom.us/)
- [小宇宙](https://www.xiaoyuzhoufm.com/) 

</details>
