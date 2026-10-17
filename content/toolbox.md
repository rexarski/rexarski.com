+++
title = "工具箱"
+++

{{< toc >}}

## 基调和实操


updated on 2026-10-16

### 基调

<mark>一，尽量不要对 app 做太多个性化的更改，开箱即用是最好的；如果复杂到需要单独导入设置备份，那么就单独拎出来提一嘴。</mark>

<mark>二，尽量用 `brew install --cask` </mark>

### 实操

#### 1. Homebrew

第一步，安装 homebrew. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

#### 2. brew install

第二步，新建一个脚本文件 `brew_setup.sh`

```bash
#!/usr/bin/env bash
set -e  # exit on error

# Update brew first
brew update && brew upgrade

# tools
cli_tools=(
  autocorrect bat btop chezmoi emacs-plus eza fish fx fzf gh git
  hugo jq lazygit llmfit neofetch
  neovim procs tmux uv wget yazi you-get zoxide
)

# apps
cask_apps=(
  1password 1password-cli ghostty applite
  anki claude claude-code iina keka obsidian maccy
  lm-studio loop omniwm pearcleaner shottr skim squirrel-app steam
  positron telegram thaw zen
)

# tap repo(s)
brew install tw93/tap/mole
brew tap d12frosted/emacs-plus
brew install djetelina/tap/cheznav
brew install --cask abue-ammar/tinycast/tinycast
brew install --cask stablyai/orca/orca

# install
brew install "${cli_tools[@]}"
brew install --cask "${cask_apps[@]}"
```

运行以上脚本文件安装。

```bash
chmod +x brew_setup.sh
./brew_setup.sh
```

#### 3. App Store install

第三步，从 Mac App Store 里安装 things 3, ia writer, drafts, xcode. 另外还有以下 safari 插件：sink it for reddit, ublock origin lite, dark reader, keepa, untrap.

#### 4. Internet download

第四步，从网站下载安装 pico-8, love2d.

#### 5. fish, fisher, tide

第五步，fish 设置成默认 shell.

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

然后安装 [fisher](https://github.com/jorgebucaran/fisher), a plugin manager for fish. 以及以下 plugins:

```
ilancosman/tide
jorgebucaran/autopair.fish
```

#### 6. App-specific setup

第六步，单独的 app 设置。主要 1password.

#### 7. Git

第七步，配置 git. 用 1password 里的 ssh-agent 生成并添加 ssh key 给 github 账号。另外可以创建一个全局的 gitignore 文件。`git config --global core.excludesfile ~/.gitignore_global`

#### 8. Safari (or not)

第八步，safari - preferences - advanced, 打开 show develop menu in menu bar.

#### 9. Timemachine destination

第九步，根据 synology 的[操作步骤](https://kb.synology.com/en-us/DSM/tutorial/How_to_back_up_files_from_Mac_to_Synology_NAS_with_Time_Machine)在 NAS 里单独创建一个 time machine 备份。

#### 10. Some keyboard shortcuts

第十步，修改以下的 keyboard shortcuts:

- system settings - keyboard - keyboard shortcuts
  - input sources - select next source in input menu: shift + command + space
  - screenshots: turn them off
  - spotlight - show spotlight search: option + space
- shottr
  - cmd + shift + 3: free select
  - cmd + shift + 4: select window
  - cmd + shift + 5: fullscreen
- things 3 - quick entry: ctrl + space
- clipboard history app (pastebot or maccy) - cmd + shift + v

#### 11. System Settings update

第十一步，去 system settings 里做三件事：

- 除非万不得已，关闭绝大多数 app 的 notifications.
- 尽量减少 menu bar 中的项目，有些也在各自 app 中设置。
- 减少 login items 和 app background activity 允许的 app.

#### 12. Name changing

第十二步，更改 computer name, host name 和 local host name:

```fish
# check
scutil --get ComputerName; scutil --get LocalHostName; scutil --get HostName

# set
sudo scutil --set ComputerName new-computer-name
sudo scutil --set LocalHostName new-local-host-name
sudo scutil --set HostName new-host-name
```

我的习惯是把 computer name 用我的常用 handle + 数字组合，hostname 则用一个简单的名字。

#### 13. doom emacs (optional)

潜在的第十三步，doom emacs 需要单独配置一下，这里就不赘述了。先前选择用 `emacs-plus` 而不是 homebrew 直接安装 `emacs`，也是因为需要 built with native compilation support.

#### 14. ghostty config

第十四步：依照这个 [gist](https://gist.github.com/rexarski/b80b90add76830b21e907539fac27644) 对 ghostty config 做修改。

#### 15. .dotfiles (w. git + chezmoi + cheznav)

第十五步：我的 [dotfiles](https://github.com/rexarski/dotfiles).

## 软件

之前我喜欢把自己电脑上**目前**安装的 app 做成一个不定期更新的列表，然后把**当下**没有安装，但是**以前**用过的 app 放在后面。现在觉得太麻烦了，尤其是有 mini + air 两台设备之后，维护就更添一分精力。

索性做一个大合集堆在一起，也不做简单描述了，纯粹作为一个记录。如果未来的我在设置新电脑的时候有需要可以快速瞥一眼过一遍——反正最核心的需求已经在上述的安装过程中满足了。

- [1Password](https://1password.com)
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12)
- [Anki](https://apps.ankiweb.net)
- [Aseprite](https://www.aseprite.org/)
- [BetterTouchTool](https://folivora.ai)
- [calibre](https://calibre-ebook.com/)
- Claude + [Claude Code](https://claude.com/product/claude-code)
- [Consent-O-Matic](https://github.com/cavi-au/Consent-O-Matic?tab=readme-ov-file)
- [DaisyDisk](https://daisydiskapp.com/)
- [DEVONthink 4](https://www.devontechnologies.com/apps/devonthink)
- [Discord](https://discord.com/)
- [Dot](https://www.trydot.app/)
- [Downie](https://software.charliemonroe.net/downie/)
- [Drafts](https://getdrafts.com/)
- [Due](https://www.dueapp.com/)
- [Eagle](https://eagle.cool/)
- [Fujifilm X RAW Studio](https://fujifilm-x.com/en-us/support/download/software/x-raw-studio/)
- [Gemini](https://macpaw.com/gemini)
- [Ghostty](https://ghostty.org)
- [Helium Browser](https://helium.computer)
- [iina](https://iina.io)
- [Insta360 Studio](https://www.insta360.com/download)
- [Keka](https://www.keka.io/en/)
- [LM Studio](https://lmstudio.ai)
- [Loop](https://github.com/MrKai77/Loop)
- [Maccy](https://github.com/p0deje/Maccy)
- [`mole`](https://github.com/tw93/Mole)
- [Musicbrainz Picard](https://picard.musicbrainz.org/)
- [MusicBox](https://apps.apple.com/us/app/musicbox-save-music-for-later/id1614730313)
- [MusicHarbor](https://apps.apple.com/cn/app/musicharbor-new-music-tracker/id1440405750)
- [mynd](https://myndnote.app/)
- [Nicotine+](https://nicotine-plus.org)
- [Obsidian](https://obsidian.md)
- [Obsidian Web Clipper](https://stephango.com/obsidian-web-clipper)
- [OmniWM](https://github.com/OmniNull/OmniWM)
- [OpenLogi](https://github.com/AprilNEA/OpenLogi)
- [PCalc](https://pcalc.com/)
- [Pearcleaner](https://github.com/alienator88/Pearcleaner)
- [Permute 3](https://software.charliemonroe.net/permute/)
- [PhotoBulk](https://photobulkeditor.com/)
- [PhotoSweeper](https://overmacs.com/)
- [PICO-8](https://www.lexaloffle.com/pico-8.php)
- [Play](https://apps.apple.com/us/app/play-save-videos-watch-later/id1596506190)
- [Plex](https://www.plex.tv/)
- [pomo](https://github.com/Bahaaio/pomo)
- [Positron](https://positron.posit.co)
- [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
- [Remind Me Faster](https://apps.apple.com/us/app/remind-me-faster/id985555908)
- [RIME | 中州韵输入法](https://rime.im/)
  - [鼠须管](https://rime.im/download/)
  - [东风破](https://github.com/rime/plum)
  - [雾凇拼音](https://github.com/iDvel/rime-ice)
- [SaneSideButtons](https://github.com/thealpa/SaneSideButtons)
- [Sequel](https://www.getsequel.app/)
- [Simple Comic](https://dancingtortoise.github.io/simplecomic/)
- [Shottr](https://shottr.cc)
- [Skim](https://skim-app.sourceforge.io)
- [Sleeve 2](https://replay.software/sleeve)
- [Steam](https://store.steampowered.com)
- [Telegram](https://www.telegram.org)
- [Thaw](https://github.com/thaw-app/Thaw)
- [Tinycast](https://github.com/abue-ammar/tinycast)
- [Transmission](https://transmissionbt.com)
- [Transmit](https://panic.com/transmit/)
- [undercut-f1](https://github.com/JustAman62/undercut-f1)
- [微信 WeChat](https://www.wechat.com/)
- [xld](https://tmkk.undo.jp/xld/index_e.html)
- [yazi](https://yazi-rs.github.io)
- [Zed](https://zed.dev/)
- [Zen Browser](https://zen-browser.app)
- [Zwift](https://www.zwift.com)
{.app-grid}

### 归档

以前用过、目前未在用的 app，留档备查。

- [Adobe Digital Editions](https://www.adobe.com/solutions/ebook/digital-editions/download.html)
- [Affinity V2 Suite](https://store.serif.com/en-us/update/universal-licence/)
- [AlDente](https://github.com/davidwernhart/AlDente)
- [Alfred](https://www.alfredapp.com/)
- [Android File Transfer](https://www.android.com/filetransfer/)
- [Antinote](https://antinote.io)
- [Anybox](https://anybox.app)
- [Applite](https://github.com/milanvarady/Applite)
- [Audacity](https://www.audacityteam.org/)
- [Buckets](https://www.budgetwithbuckets.com/)
- [Brooklyn](https://github.com/pedrommcarrasco/Brooklyn)
- [Calendr](https://github.com/pakerwreah/Calendr)
- [Cap](https://github.com/CapSoftware/cap)
- [coconutBattery](https://coconut-flavour.com/coconutbattery/)
- [Concept2 Utility](https://www.concept2.com/support/software/utility)
- [Cursor](https://cursor.com)
- [Cyberduck](https://cyberduck.io/)
- [Dark Noise](https://darknoise.app/)
- [darktable](https://www.darktable.org)
- [Darkroom](https://darkroom.co/)
- [Day One](https://dayoneapp.com/)
- [Deliveries](https://deliveries.app/en.html)
- [Fantastical](https://flexibits.com/fantastical)
- [Figma](https://www.figma.com/)
- Final Cut Pro + Motion + Compressor
- [Flighty](https://apps.apple.com/us/app/flighty-live-flight-tracker/id1358823008)
- [Fliqlo Flip Clock](https://fliqlo.com/)
- [geist-font](https://github.com/vercel/geist-font)
- [GitHub Desktop](https://desktop.github.com/)
- [GoodLinks](https://goodlinks.app)
- Google Chrome
- [Handbrake](https://handbrake.fr)
- [Handy](https://github.com/cjpais/Handy)
- [Hidden Bar](https://github.com/dwarvesf/hidden)
- [Hush](https://github.com/oblador/hush)
- ~~[Ice](https://github.com/jordanbaird/Ice)~~
- [iTerm2](https://iterm2.com)
- ~~[Itsycal for Mac](https://www.mowglii.com/itsycal/)~~
- [Ivory](https://tapbots.com/ivory/)
- [Karabiner Elements](https://karabiner-elements.pqrs.org/)
- [KeyCastr](https://github.com/keycastr/keycastr)
- [KeyClu](https://sergii.tatarenkov.name/keyclu/support/)
- [Klack](https://tryklack.com/)
- [Latest](https://max.codes/latest/)
- [LocalSend](https://localsend.org)
- ~~[Lunar](https://lunar.fyi/)~~
- [Mactracker](https://mactracker.ca/)
- [mac-cleanup-py](https://github.com/mac-cleanup/mac-cleanup-py)
- [Maestral](https://maestral.app)
- [Marked 2](https://marked2app.com/)
- [MarkEdit](https://github.com/MarkEdit-app/MarkEdit)
- ~~[Min Browser](https://github.com/minbrowser/min)~~
- [monolith](https://github.com/Y2Z/monolith)
- [Mononote](https://www.digitalminimalist.com/tools/mononote)
- [Moom](https://manytricks.com/moom/)
- [MultiViewer for F1](https://multiviewer.app)
- [NetNewsWire](https://ranchero.com/netnewswire/)
- [Numi](https://numi.app/)
- [Ollama](https://github.com/jmorganca/ollama)
- [OrbStack](https://orbstack.dev/)
- [OpenEmu](https://github.com/OpenEmu/OpenEmu)
- [PasteBot](https://tapbots.com/pastebot/)
- [Pictogram](https://pictogramapp.com/)
- [Picotron](https://www.lexaloffle.com/picotron.php)
- [Pins](https://get-pins.app/)
- [Plain Text Editor](https://apps.apple.com/us/app/plain-text-editor/id1572202501)
- [Pocket Casts](https://pocketcasts.com/)
- [Raycast](https://www.raycast.com)
- [Reeder & Reeder Classic](https://reederapp.com/)
- [Reminders Menubar](https://github.com/DamascenoRafael/reminders-menubar)
- [Rocket](https://matthewpalmer.net/rocket/)
- [Scratchpad](https://apps.apple.com/us/app/scratchpad/id6504040051)
- [SD Card Formatter](https://www.sdcard.org/downloads/formatter/)
- [Shareful](https://sindresorhus.com/shareful)
- [Spotify](https://open.spotify.com/)
- [Syncthing](https://syncthing.net/)
- [Synology Drive Client](https://www.synology.com/en-us/dsm/feature/drive)
- [Tapestry](https://usetapestry.com/)
- [texifier](https://www.texifier.com/)
- [TimeMachineEditor](https://tclementdev.com/timemachineeditor/)
- [Tuna](https://tunaformac.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [VLC](https://www.videolan.org/)
- [YACReader](https://www.yacreader.com/)
{.app-grid}

## 字体

### Sans-serif

- [Lexend](https://www.lexend.com/), `brew install --cask font-lexend`
- [Roboto](https://fonts.google.com/specimen/Roboto), `brew install --cask font-roboto`
- Amazon Ember from [Amazon Complete Font Set](https://developer.amazon.com/en-US/alexa/branding/echo-guidelines/identity-guidelines/typography)
- [LXGW Neo XiHei / 霞鹜新晰黑](https://github.com/lxgw/LxgwNeoXiHei)
- [Atkinson Hyperlegible](https://brailleinstitute.org/freefont), `brew install --cask font-atkinson-hyperlegible`
  - Next, `brew install --cask font-atkinson-hyperlegible-next`

### Serif

- Bookerly from [Amazon Complete Font Set](https://developer.amazon.com/en-US/alexa/branding/echo-guidelines/identity-guidelines/typography)
- [LXGW WenKai / 霞鹜文楷](https://github.com/lxgw/LxgwWenKai)
- [喜鹊宋体](https://xiquezaozi.taobao.com/), paid
- [Charis SIL](https://software.sil.org/charis/), `brew install --cask font-charis-sil`
- [Libron](https://github.com/nicoverbruggen/libron)

### Monospace

- [Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono), `brew install --cask font-roboto-mono`
- [IBM 3270](https://github.com/rbanffy/3270font), `brew install --cask font-3270`, `brew install --cask font-3270-nerd-font`
- [JetBrains Maple Mono](https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono), `brew install --cask font-jetbrains-maple-mono`, `brew install --cask font-jetbrains-maple-mono-nf`
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/), `brew install --cask font-jetbrains-mono`
- [Ubuntu Mono](https://design.ubuntu.com/font/), `brew install --cask font-ubuntu-mono`
- [Atkinson Hyperlegible Mono](https://brailleinstitute.org/freefont), `brew install --cask font-atkinson-hyperlegible-mono`
- [Server Mono](https://servermono.com/), `brew install --cask font-server-mono`

## KOReader（Kobo）配置备忘


updated on 2026-10-03

整理自站内相关记录（如 [Kobo KOReader 重装](/posts/kobo-koreader-reset/)、[字典](/posts/add-dictionary-to-koreader/)、[Calibre 与 USB](/posts/weekend-problem-solving-session/)），方便以后重装或换机时一页看完。**设备以 Kobo + KOReader 为主**；其他机型安装路径见 [官方 Wiki](https://github.com/koreader/koreader/wiki)。

### 重装前备份

- 备份 **字典**、**笔记/标注** 等个人数据，再执行恢复出厂或覆盖安装。
- Kobo 官方重置说明可参考：[Manual reset Kobo Clara Colour & Kobo Clara BW](https://help.kobo.com/hc/en-us/articles/18332008301719-Manual-reset-Kobo-Clara-Colour-Kobo-Clara-BW)。

### 安装与更新

- 官方文档：[Installation on Kobo devices](https://github.com/koreader/koreader/wiki/Installation-on-Kobo-devices)
- 社区常用入口：
  - [One click install package（MobileRead）](https://www.mobileread.com/forums/showpost.php?p=3797095&postcount=1)
  - [Install script（MobileRead）](https://www.mobileread.com/forums/showpost.php?p=3797096&postcount=2)
- <mark>装好后可用 **OTA** 跟到当前稳定版（升级前同样建议备份）。</mark>

### Calibre 与 USB 传输（易踩坑）

- **必须在 Kobo 原生首页进入 USB 传输模式**，不要在 KOReader 里开 USB。否则 Calibre 可能认不出刚传的书——因为设备侧的 **`KoboReader.sqlite`**（例如 macOS 上常见为 `/Volumes/KOBOeReader/.kobo/KoboReader.sqlite`）需要在 **Kobo 系统界面** 连接时才会按预期更新；在 KOReader 下连接则不会完整更新这份库信息。
- 隐藏目录在 Finder 里可用 <kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>.</kbd> 切换显示。

### 字典

- 词典来源示例：[reader.dict](https://www.reader-dict.com/)（基于 Wiktionary；单语免费，双语为一次性付费）、以及社区分享的词典包（如 Reddit 讨论中的 Oxford 等，自行甄别版权与来源）。
- **安装路径（Kobo）**：在 `/Volumes/…` 下进入 **`.adds/`** 中 KOReader 的数据目录，将词典文件放入 **`data/dict/`**（具体层级以你设备上实际路径为准，可用终端 `find` 辅助定位）。
- 官方说明：[Dictionary support](https://github.com/koreader/koreader/wiki/Dictionary-support)

### 字体与图书元数据

- **KOReader 内字体**：将字体文件放入 KOReader 的 fonts 目录（与安装方式一致，通常在 `.adds/koreader/` 下对应位置）。
  - **更多桌面端字体列表**见下文[字体](#字体)一节。
  - [Libron](https://github.com/nicoverbruggen/libron)
- **Calibre**（与书库质量相关，间接影响推到阅读器上的体验）：
  - [Calibre 推荐配置与插件 - 雅余](https://yayu.net/4767.html)
  - [Cirn09/calibre-do-not-translate-my-path](https://github.com/Cirn09/calibre-do-not-translate-my-path)
  - [fugary/calibre-douban](https://github.com/fugary/calibre-douban)
  - [DeACSM](https://github.com/Leseratte10/acsm-calibre-plugin)

### Plugin

- [ZenOS](https://zen-labs.org/zen-os)
- [ZenPM](https://zen-labs.org/zen-pm)
- [filebrowserplus](https://github.com/patelneeraj/filebrowserplus.koplugin)
- (Optional) [Bookends](https://github.com/AndyHazz/bookends.koplugin)
- (Optional) [Bookshelf](https://github.com/AndyHazz/bookshelf.koplugin)
- (Optional) [foot-cream](https://github.com/Fank1/foot-cream)
- ~~[kobo.koplugin](https://ogkevin.github.io/kobo.koplugin/introduction.html) for Kobo remote page turner~~

### Wallpaper

- [电子墨水屏壁纸合集](https://github.com/dmellok/eink-screens)，包含有一代的 Pokédex.

### User patches

官方说明：[User patches](https://koreader.rocks/user_guide/#L2-userpatches)（`koreader/patches/` 目录，文件名与优先级规则见文档）。

个人在用：

- **[omer-faruq/koreader-user-patches](https://github.com/omer-faruq/koreader-user-patches)**：**Book receipt shortcut and lockscreen**

灵感参考：[r/koreader 展示帖](https://www.reddit.com/r/koreader/comments/1osqlxf/show_your_koreader_ui/)。

> **提示**：大版本升级后若出现奇怪黑屏或退出卡顿，优先排查是否手滑覆盖错文件；必要时干净重装 + 按上表逐步恢复补丁。

### 路径速查（macOS 挂载 Kobo 时）

| 用途 | 典型路径（卷名因设备而异） |
|------|---------------------------|
| Kobo 书库数据库 | `/Volumes/KOBOeReader/.kobo/KoboReader.sqlite` |
| KOReader 标注等剪贴板导出 | `/Volumes/KOBOeReader/.adds/koreader/clipboard/` |
| KOReader 数据根目录 | `/Volumes/KOBOeReader/.adds/koreader/`（其下含 `data/dict/` 等） |

### 延伸阅读

- [KOReader Releases](https://github.com/koreader/koreader/releases)

## 文本

- [Drafts](https://getdrafts.com/)：打草稿
- [iA Writer](https://ia.net/writer)：沉浸写作
- [Hobonichi](https://www.1101.com/store/techo/en/)：极简日记
- [Obsidian](https://obsidian.md)：笔记+日记
- [Working Copy](https://workingcopy.app)：偶尔在手机上写代码
- [Claude Code](https://claude.com/product/claude-code), [pi](https://pi.dev/) + [Orca](https://onorca.dev/)：远程开发
