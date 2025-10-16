---
title: "安装 Doom Emacs 的一些碎碎念"
date: 2025-10-16T13:55:40-04:00
description: "我又开始折腾 Emacs 了。这次目标是装上 Doom Emacs，在 macOS 上跑得顺滑一点。"
slug: "doom-emacs-macos-installation"
tags: ["没事折腾"]
---

过程其实挺顺利，只是中途遇到一些奇怪的 warning，最后查到 GitHub 上大家也一样。以下是整个安装过程的记录和一点注解。

## 安装 Doom Emacs

```fish
# install doom emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs ~/.config/emacs/bin/doom install
# add to path
fish_add_path ~/.config/emacs/bin

# install required font (symbols only)
brew install --cask font-symbols-only-nerd-font
```

克隆仓库后记得把 Doom 的可执行文件加入 `PATH`，不然后续命令会找不到。字体部分则是 Nerd Font 的符号版，不然一些 UI 元素会显示成方块。

## 检查环境并安装依赖

```fish
doom doctor
# gives me 1 error 6 warnings

# rg binary is required for a faster search
brew install ripgrep

# “Emacs was not built with native compilation support.”
# since i installed emacs from homebrew without native compilation

# fd is missing, it's a faster find
brew install fd

# missing markdown compiler
brew install pandoc

# missing shellcheck
brew install shellcheck
```

doom doctor 会做一次全面体检。我这里出现了 1 个 error 和 6 个 warning。主要问题都是缺少一些工具：`ripgrep`、`fd`、`pandoc`、`shellcheck` 等。安装好这些之后，速度会明显提升。

另一个提示是「Emacs was not built with native compilation support」，这通常是因为从 Homebrew 安装的 Emacs 没有启用原生编译功能。于是我换了个思路。

## 换用 Emacs Plus

因为之前直接 `brew install emacs` 了，所以这里又多绕了一圈。

```fish
brew uninstall emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus # latest release emacs 30

# link it so emacs points to the right one (if apple silicon then no need to do so)
brew link emacs-plus --overwrite

# check version
emacs --version

# Install GNU coreutils
brew install coreutils
```

emacs-plus 是社区维护的版本，可以启用更多编译选项。安装完后建议检查版本是否正确指向新版本。同时补上 GNU coreutils，让 `gls` 等命令可用。

## 修改 Doom 配置

在 `~/.config/doom/config.el` （3.0 版本之前的 doom 配置文件会不同）中添加：

```elisp
(setq insert-directory-program (executable-find "gls"))
```

这是为了让 Emacs 使用 GNU 的 `ls`，避免 macOS 自带版本导致的一些奇怪行为。

## Fish Shell 的兼容问题

Doom 的启动脚本有时候会提示非 POSIX shell 的 warning。因为我用的是 fish，所以需要在 `config.el` 中加上：

```elisp
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell "/opt/homebrew/bin/fish")
(setq-default explicit-shell-file-name "/opt/homebrew/bin/fish")
```

理论上这样可以让 Emacs 内部调用 bash，而在终端模拟器（vterm）中继续使用 fish。不过实际测试下来，`doom doctor` 仍然给出 warning。到这一步逻辑上没问题……

在 GitHub 上搜了一下，果然同样的情况也有人提过：[issue #8136: doom doctor resolution to fish shell issue does not remove warning #8136
](https://github.com/doomemacs/doomemacs/issues/8136)。

看起来这只是 Doom 对 fish 的兼容性问题——并不会真的影响使用。我打算先放着，毕竟 Emacs 的世界，总有点混沌是正常的。
