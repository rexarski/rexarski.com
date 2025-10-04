---
title: "再次尝试给 iPod Video 安装 Rockbox"
date: 2025-10-04T19:19:07-04:00
description: "受不了 macOS 的音乐管理了。"
slug: "rockbox-on-ipod-video-2025"
tags: ["捣鼓硬件"]
---

Finder 传歌的体验真的糟透了，即便用 MusicBrainz Picard 校对过，一旦进了 macOS 的 Music／Finder，就像进了搅拌机——封面乱飞、专辑名错位、年份全没了。更别提 macOS 上 iTunes 这玩意儿早就不存在了。

<div style="display: flex; justify-content: center;">
<img src="https://raw.githubusercontent.com/rexarski/oss/main/2025-10-04-ipod-rockbox.jpg" alt="iPod with Rockbox" style="max-width: 50%;">
</div>

方法也很简单，但是必须一台 Windows PC.

1. 先在 Windows 上用 iTunes 格式化 iPod。
2. 接回 Mac，打开命令行。
3. 假设你已经把 Rockbox 1.5.0 放在 Applications 文件夹里，打开 Terminal，输入：`sudo /Applications/RockboxUtility.app/Contents/MacOS/RockboxUtility` 输入密码后 Rockbox Utility 会以 root 权限启动，从而能直接访问 iPod. 接下来像以前一样跑安装流程就行。
4. （需要的话）把官方的 PDF 手册丢给 ChatGPT，跑个快速 Q&A，当作临时说明书。
5. 把音乐文件拷进 iPod（除了 /.rockbox 目录外的任何地方都行，最好是 /music）。
6. 重新索引，然后享受成果。
7. （需要的话）如果想手动往 iPod 里拷文件？回到 Terminal，`cd /Volumes/[你的 iPod 名称]`，列一下内容，会看到隐藏的 `.rockbox` 目录。Command 键加点击可以直接在 Finder 里打开它，不行的话就在命令行里完成操作。

非常简单。真不知道[当时](/posts/2024/08/ipod-import)是怎么没用起来的。
