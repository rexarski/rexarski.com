+++
title = "基调和实操"
weight = 1
+++

# 基调和实操

{{< toc >}}

updated on 2026-02-15

## 基调

<mark>一，尽量不要对 app 做太多个性化的更改，开箱即用是最好的；如果复杂到需要单独导入设置备份，那么就单独拎出来提一嘴。</mark>

<mark>二，尽量用 `brew install --cask` </mark>

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
  bat btop emacs-plus eza fish fx git jq lazygit neofetch
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

【更新】第十四步：依照这个 [gist](https://gist.github.com/rexarski/b80b90add76830b21e907539fac27644) 对 ghostty config 做修改。

