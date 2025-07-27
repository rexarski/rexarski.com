+++
title = "回归 vanilla (fish) shell"
date = "2024-01-30"
description = "从使用十年的 oh-my-zsh 切换到 fish shell 的完整迁移指南，包括卸载、安装、配置默认 shell、路径设置和常用别名配置的详细步骤。"
tags = ["代码经验"]
+++

<details>
<summary>原文 Back to a vanilla (fish) shell</summary>
- <mark>Updated on 2024-09-06:</mark> Since `exa` is no longer maintained, we need to add the following in `~/.config/fish/config.fish` instead:

```fish
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end
```

- Decided to [say goodbye to oh-my-zsh](https://news.ycombinator.com/item?id=39100308) after a decade and pursue the pure joy of simplicity.[^1]
- Uninstalled oh-my-zsh with `uninstall_oh_my_zsh`. (This is handy, I'll give it that.)
- Installed [fish](https://fishshell.com/) from Homebrew `brew install fish`
- Followed this [gist](https://gist.github.com/gagarine/cf3f65f9be6aa0e105b184376f765262) to set `fish` as default shell. The documentation might be outdated since the default path to fish is now different: `/opt/homebrew/bin/fish`. Thanks to macOS's updates in recent years.
- Added the list of "known shells": `sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'`
- Restarted the CLI and ran command: `chsh -s /opt/homebrew/bin/fish`.
- Restarted the CLI and added brew binaries in fish path: `fish_add_path /opt/homebrew/bin`
- Added a few aliases frequently used in `~/.config/fish/config.fish`.
- Added a snippet to use ~~`exa`~~ `eza` easily. Credit to [Ruihao Li](https://ruihao-li.github.io/blog/fish-shell-customization/).
- Used `cmd+shift+p` in VSC to install `code` command in `PATH`.
- Used `fish_config` to customize my shell prompt.

Now I'm in peace now.

[^1]: To be precise, I also removed Starship from my [last post](../how-to-start-a-starship/) as fish is pretty good function-wise straight out of box.
</details>

<mark>以下为 GPT-4o 翻译内容：</mark>

- <mark>2024-09-06更新：</mark> 由于 `exa` 已不再维护，我们需要在 `~/.config/fish/config.fish` 中添加以下内容：

```fish
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end
```

以下是文章内容的翻译，涉及到代码块的部分保持不变：

# 回到原始（fish）shell

- <mark>更新于2024-09-06：</mark>由于`exa`不再维护，我们需要在`~/.config/fish/config.fish`中添加以下内容：

```fish
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end
```

- 决定在使用了十年后[告别 oh-my-zsh](https://news.ycombinator.com/item?id=39100308)，追求纯粹的简单快乐。[^1]
- 使用 `uninstall_oh_my_zsh` 卸载了 oh-my-zsh.（这很方便，我承认这一点。）
- 从 Homebrew 安装了 [fish](https://fishshell.com/)：`brew install fish`
- 根据这个 [gist](https://gist.github.com/gagarine/cf3f65f9be6aa0e105b184376f765262) 将 `fish` 设置为默认shell。由于近年来macOS的更新，文档可能已经过时，因为 fish 的默认路径现在不同：`/opt/homebrew/bin/fish`。
- 添加了“已知 shell ”列表：`sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'`
