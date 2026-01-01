+++
title = "toolbox"
menu = "not on main"
+++

# toolbox

{{< toc >}}

updated on 2025-12-29

**新的设备到手之后最好还是从头设置一遍**。我就有点后悔去年的 Mac Mini 是从 time machine 恢复的，至今还能在里头找到很多「前世记忆」。

## 基调

<mark>一，尽量不要对 app 做太多个性化的更改，开箱即用是最好的；如果复杂到需要单独导入设置备份，那么就单独拎出来提一嘴。</mark>

<mark>二，尽量用 `brew install --cask` 来安装。</mark>

## 实操

第一步，安装 homebrew. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

第二步，新建一个脚本文件 `brew_setup.sh`

```bash
#!/usr/bin/env bash
set -e  # exit on error

# Update brew first
brew update && brew upgrade

# tools
cli_tools=(
  bat btop emacs-plus eza fish fx git jq neofetch
  neovim ollama procs r tmux uv wget you-get zoxide
)

# apps
cask_apps=(
  1password 1password-cli ghostty antinote applite maestral
  raycast anki cursor iina keka obsidian maccy
  pearcleaner r shottr skim squirrel-app steam 
  positron zen
)

# tap repo(s)
brew install tw93/tap/mole
brew tap d12frosted/emacs-plus

# install
brew install "${cli_tools[@]}"
brew install --cask "${cask_apps[@]}"

# start services
# brew services start ollama
# brew services stop ollama
```

第三步，运行以上脚本文件安装。

```bash
chmod +x brew_setup.sh
./brew_setup.sh
```

第四步，从 Mac App Store 里安装 things 3, ia writer, reeder, ivory, xcode. 另外还有以下 safari 插件：sink it for reddit, ublock origin lite, dark reader, keepa, singlefile, untrap.

第五步，从网站下载安装 pico-8, love2d.

第六步，fish 设置成默认 shell.

```bash
# 确认 fish 位置
which fish
# 应该是 /opt/homebrew/bin/fish
# 路径添加到允许的 shell 列表
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
# 改为默认 shell
chsh -s /opt/homebrew/bin/fish
# 重开 terminal 确认
echo $SHELL
# One more thing
fish_add_path /opt/homebrew/bin
# 打开在浏览器中设置
fish_config
```

在 `config.fish` 文件中添加：

Add the following lines to `~/.config/fish/config.fish`

```fish
zoxide init fish | source

# aliases
alias pip=pip3
alias python=python3

# eza file listing
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end
```

第七步，单独的 app 设置。主要是两个：1password 和 raycast. 前者从云端回复备份，后者在免费版的情况下需要从本地设置备份恢复。

第八步，配置 git. 用 1password 里的 ssh-agent 生成并添加 ssh key 给 github 账号。另外可以创建一个全局的 gitignore 文件。`git config --global core.excludesfile ~/.gitignore_global`

第九步，safari - preferences - advanced, 打开 show develop menu in menu bar.

第十步，根据 synology 的[操作步骤](https://kb.synology.com/en-us/DSM/tutorial/How_to_back_up_files_from_Mac_to_Synology_NAS_with_Time_Machine)在 NAS 里单独创建一个 time machine 备份。

第十一步，修改以下的 keyboard shortcuts:

- system settings - keyboard - keyboard shortcuts
  - input sources - select next source in input menu: shift + command + space
  - screenshots: turn them off
  - spotlight - show spotlight search: option + space
- shottr
  - cmd + shift + 3: free select
  - cmd + shift + 4: select window
  - cmd + shift + 5: fullscreen
- things 3 - quick entry: ctrl + space
- clipboard history app (pastebot, raycast, or maccy) - cmd + shift + v
- raycast
  - invoke: cmd + space
  - hyperkey: caps lock
  - hyperkey + specific letter = launch an app, e.g. hyper + P = quick access to 1password, hyper + F = calendar app (多少因为 fantastical 时期留下来的习惯), hyper + O = obsidian (如果有 bettertouchtool 则交给它管理)
  - emoji selector: ctrl + cmd + space

第十二步，去 system settings 里做三件事：

- 除非万不得已，关闭绝大多数 app 的 notifications.
- 尽量减少 menu bar 中的项目，有些也在各自 app 中设置。
- 减少 login items 和 app background activity 允许的 app.

第十三步，更改 computer name, host name 和 local host name:

```fish
# check
scutil --get ComputerName; scutil --get LocalHostName; scutil --get HostName

# set
sudo scutil --set ComputerName new-computer-name
sudo scutil --set LocalHostName new-local-host-name
sudo scutil --set HostName new-host-name
```

我的习惯是把 computer name 用我的常用 handle + 数字组合，hostname 则用一个简单的名字。

潜在的第十四步，doom emacs 需要单独配置一下，这里就不赘述了。先前选择用 `emacs-plus` 而不是 homebrew 直接安装 `emacs`，也是因为需要 built with native compilation support.

到这里就算是完工了。

***

## toolbox maximalism

之前我喜欢把自己电脑上**目前**安装的 app 做成一个不定期更新的列表，然后把**当下**没有安装，但是**以前**用过的 app 放在后面。现在觉得太麻烦了，尤其是有 mini + air 两台设备之后，维护就更添一分精力。

索性做一个大合集堆在一起，也不做简单描述了，纯粹作为一个记录。如果未来的我在设置新电脑的时候有需要可以快速瞥一眼过一遍——反正最核心的需求已经在上述的安装过程中满足了。

> [1Password](https://1password.com), [Adobe Digital Editions](https://www.adobe.com/solutions/ebook/digital-editions/download.html), [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12), [Anki](https://apps.ankiweb.net), [Anybox](https://anybox.app), [Antinote](https://antinote.io), [Applite](https://github.com/milanvarady/Applite), [Aseprite](https://www.aseprite.org/), [BetterTouchTool](https://folivora.ai), [Buckets](https://www.budgetwithbuckets.com/), [calibre](https://calibre-ebook.com/), ChatGPT + [Codex](https://openai.com/codex/), Claude + [Claude Code](https://claude.com/product/claude-code), [Cursor](https://cursor.com), [DaisyDisk](https://daisydiskapp.com/), [DEVONthink 4](https://www.devontechnologies.com/apps/devonthink), [Discord](https://discord.com/), [Downie](https://software.charliemonroe.net/downie/), [Drafts](https://getdrafts.com/), [Due](https://www.dueapp.com/), [Eagle](https://eagle.cool/), [Fujifilm X RAW Studio](https://fujifilm-x.com/en-us/support/download/software/x-raw-studio/), [Gemini](https://macpaw.com/gemini), [Ghostty](https://ghostty.org), [GoodLinks](https://goodlinks.app), [Hush](https://github.com/oblador/hush), [iina](https://iina.io), [iTerm2](https://iterm2.com), [Keka](https://www.keka.io/en/), [Lunar](https://lunar.fyi/), [Maccy](https://github.com/p0deje/Maccy), [Maestral](https://maestral.app), [Marked 2](https://marked2app.com/), [`mole`](https://github.com/tw93/Mole), [MultiViewer for F1](https://multiviewer.app), [Musicbrainz Picard](https://picard.musicbrainz.org/), [MusicBox](https://apps.apple.com/us/app/musicbox-save-music-for-later/id1614730313), [MusicHarbor](https://apps.apple.com/cn/app/musicharbor-new-music-tracker/id1440405750), [Nicotine+](https://nicotine-plus.org), [Obsidian](https://obsidian.md), [Obsidian Web Clipper](https://stephango.com/obsidian-web-clipper), [Ollama](https://github.com/jmorganca/ollama), [OrbStack](https://orbstack.dev/), [PasteBot](https://tapbots.com/pastebot/), [PCalc](https://pcalc.com/), [Pearcleaner](https://github.com/alienator88/Pearcleaner), [Permute 3](https://software.charliemonroe.net/permute/), [PhotoBulk](https://photobulkeditor.com/), [PICO-8](https://www.lexaloffle.com/pico-8.php), [Picotron](https://www.lexaloffle.com/picotron.php), [Play](https://apps.apple.com/us/app/play-save-videos-watch-later/id1596506190), [Plex](https://www.plex.tv/), [Positron](https://positron.posit.co), [Raycast](https://www.raycast.com), [RIME | 中州韵输入法](https://rime.im/) ([鼠须管](https://rime.im/download/), [东风破](https://github.com/rime/plum), [雾凇拼音](https://github.com/iDvel/rime-ice)), [SaneSideButtons](https://github.com/thealpa/SaneSideButtons), [Sequel](https://www.getsequel.app/), [Shareful](https://sindresorhus.com/shareful), [Shottr](https://shottr.cc), [Skim](https://skim-app.sourceforge.io), [Sleeve 2](https://replay.software/sleeve), [Steam](https://store.steampowered.com), [Telegram](https://www.telegram.org), [Transmission](https://transmissionbt.com), [undercut-f1](https://github.com/JustAman62/undercut-f1), [微信 WeChat](https://www.wechat.com/), [xld](https://tmkk.undo.jp/xld/index_e.html), [Zen Browser](https://zen-browser.app), [Zwift](https://www.zwift.com)


### 字体
- [Lexend](https://www.lexend.com/), sans-serif, `brew install --cask font-lexend`
- [Roboto](https://fonts.google.com/specimen/Roboto), sans-serif, `brew install --cask font-roboto`
- [Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono), monospace, `brew install --cask font-roboto-mono`
- [IBM 3270](https://github.com/rbanffy/3270font), monospace, `brew install --cask font-3270`, `brew install --cask font-3270-nerd-font`
- [JetBrains Maple Mono](https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono), monospace, `brew install --cask font-jetbrains-maple-mono`, `brew install --cask font-jetbrains-maple-mono-nf`
- [Victor Mono](https://rubjo.github.io/victor-mono/), monospace, `brew install --cask font-victor-mono`
- [Ubuntu Mono](https://design.ubuntu.com/font/), monospace, `brew install --cask font-ubuntu-mono`
- Amazon Ember and Bookerly from [Amazon Complete Font Set](https://developer.amazon.com/en-US/alexa/branding/echo-guidelines/identity-guidelines/typography), sans serif, serif
- [LXGW WenKai / 霞鹜文楷](https://github.com/lxgw/LxgwWenKai), serif
- [LXGW Neo XiHei / 霞鹜新晰黑](https://github.com/lxgw/LxgwNeoXiHei), sans-serif
- [喜鹊宋体](https://xiquezaozi.taobao.com/), serif, paid
- [Atkinson Hyperlegible](https://brailleinstitute.org/freefont), sans-serif, `brew install --cask font-atkinson-hyperlegible`
  - Next, sans-serif, `brew install --cask font-atkinson-hyperlegible-next`
  - Mono, monospace, `brew install --cask font-atkinson-hyperlegible-mono`
- [Charis SIL](https://software.sil.org/charis/), serif, `brew install --cask font-charis-sil`
- [Server Mono](https://servermono.com/), monospace, `brew install --cask font-server-mono`

### 归档

> [Affinity V2 Suite](https://store.serif.com/en-us/update/universal-licence/), [AlDente](https://github.com/davidwernhart/AlDente), [Alfred](https://www.alfredapp.com/), [Android File Transfer](https://www.android.com/filetransfer/), [Audacity](https://www.audacityteam.org/), [Brooklyn](https://github.com/pedrommcarrasco/Brooklyn), [coconutBattery](https://coconut-flavour.com/coconutbattery/), [Concept2 Utility](https://www.concept2.com/support/software/utility), [Dark Noise](https://darknoise.app/), [Darkroom](https://darkroom.co/), [Day One](https://dayoneapp.com/), [Deliveries](https://deliveries.app/en.html), [Fantastical](https://flexibits.com/fantastical), [Figma](https://www.figma.com/), Final Cut Pro + Motion + Compressor, [Flighty](https://apps.apple.com/us/app/flighty-live-flight-tracker/id1358823008), [Fliqlo Flip Clock](https://fliqlo.com/), [GitHub Desktop](https://desktop.github.com/), [Handbrake](https://handbrake.fr), [Ice](https://github.com/jordanbaird/Ice), [Itsycal for Mac](https://www.mowglii.com/itsycal/), [Karabiner Elements](https://karabiner-elements.pqrs.org/), [KeyCastr](https://github.com/keycastr/keycastr), [KeyClu](https://sergii.tatarenkov.name/keyclu/support/), [Klack](https://tryklack.com/), [Latest](https://max.codes/latest/), [LocalSend](https://localsend.org), [Loop](https://github.com/MrKai77/Loop), [Mactracker](https://mactracker.ca/), [mac-cleanup-py](https://github.com/mac-cleanup/mac-cleanup-py), [Min Browser](https://github.com/minbrowser/min), [`monolith`](https://github.com/Y2Z/monolith), [Moom](https://manytricks.com/moom/), [NetNewsWire](https://ranchero.com/netnewswire/), [Numi](https://numi.app/), [OpenEmu](https://github.com/OpenEmu/OpenEmu), [Pictogram](https://pictogramapp.com/), [Pins](https://get-pins.app/), [Plain Text Editor](https://apps.apple.com/us/app/plain-text-editor/id1572202501), [Pocket Casts](https://pocketcasts.com/), [Reeder Classic](https://reederapp.com/), [Reminders Menubar](https://github.com/DamascenoRafael/reminders-menubar), [Rocket](https://matthewpalmer.net/rocket/), [Scratchpad](https://apps.apple.com/us/app/scratchpad/id6504040051), [SD Card Formatter](https://www.sdcard.org/downloads/formatter/), [Spotify](https://open.spotify.com/), [Tapestry](https://usetapestry.com/), [texifier](https://www.texifier.com/), [TimeMachineEditor](https://tclementdev.com/timemachineeditor/), [Transmit](https://panic.com/transmit/), [Visual Studio Code](https://code.visualstudio.com/), [VLC](https://www.videolan.org/), [YACReader](https://www.yacreader.com/), [Zed](https://zed.dev/)