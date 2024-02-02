+++
title = "Back to a vanilla (fish) shell"
date = "2024-01-30"
description = ""
tags = ["cli"]
+++

- Decided to [say goodbye to oh-my-zsh](https://news.ycombinator.com/item?id=39100308) after a decade and pursue the pure joy of simplicity.[^1]
- Uninstalled oh-my-zsh with `uninstall_oh_my_zsh`. (This is handy, I'll give it that.)
- Installed [fish](https://fishshell.com/) from Homebrew `brew install fish`
- Followed this [gist](https://gist.github.com/gagarine/cf3f65f9be6aa0e105b184376f765262) to set `fish` as default shell. The documentation might be outdated since the default path to fish is now different: `/opt/homebrew/bin/fish`. Thanks to macOS's updates in recent years.
- Added the list of "known shells": `sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'`
- Restarted the CLI and ran command: `chsh -s /opt/homebrew/bin/fish`.
- Restarted the CLI and added brew binaries in fish path: `fish_add_path /opt/homebrew/bin`
- Added a few aliases frequently used in `~/.config/fish/config.fish`.
- Added a snippet to use `exa` easily. Credit to [Ruihao Li](https://ruihao-li.github.io/blog/fish-shell-customization/).
- Used `cmd+shift+p` in VSC to install `code` command in `PATH`.
- Used `fish_config` to customize my shell prompt.

Now I'm in peace now.

[^1]: To be precise, I also removed Starship from my [last post](../how-to-start-a-starship/) as fish is pretty good function-wise straight out of box.
