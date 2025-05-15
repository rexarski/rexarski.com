---
title: "Day One 日记搬家"
date: 2025-05-14T19:44:25-04:00
slug: "day-one-migration"
description: "把十年日记从 Day One 搬家到 Obsidian 的心路历程。"
tags: ["没事折腾"]
---

对 Day One 的抱怨大概开始于几年前同步冲突、互相覆盖的问题，然后就想要顺应「keep everything local and centralized」的潮流，所以就想要把高悬云端的多年日记「无痛」地迁移到 Obsidian.

这个想法还是太天真了，实际操作下来碰到了不少问题。工具（或者说插件）用的是 [`obsidian-day-one-importer`](https://github.com/MarcDonald/obsidian-day-one-importer)——把十年、4 个多 GB 的数据导出成 JSON 文件，附带三个文件夹，分别是 `audios`, `videos` 和 `photos`.

然后就开始了一步步的大扫除工作。

1. 首先，code block 的问题最大，大多数都被拆成了多个小代码块，多出了无数额外空行。
2. 其次就是 YouTube 链接，很多时候我没有把干净的链接粘贴到日记里，所以链接里带了后缀，这一导出，这些 tag 有时候就字面意义上的「碎了一地」。
3. 再者就是 webp 格式的图片在 Obsidian 里渲染有问题，无法显示。与之类似的是，音频文件也是时有时无。

当然房间里的大象是——我总觉得云存储是无限♾️的，所以总给日记里甩来很多大文件，诸如航拍视频等等。现在白白吃掉 Obsidian 可同步的 4GB 空间，似乎也有点夸张了。

那么，索性就把照片删了吧，只保留文字。转念一想：虽然删掉的照片大多数在 Photos 里其实有备份，但有一部分感觉只有存在于当下的截图中才能体现出「即视感」；单独出现在 Photos 里莫名其妙，或者在日记中留出空白也很突兀。但，又能怎么办呢？过去的日子这样溜走，也就只能留下无奈了呀。

所以在暂时删除了多媒体文件之后，又让 [Gemini 2](https://macpaw.com/gemini) 这个工具（不是 Google 的）去扫描了一遍「照片库 + Day One 图片」，去重，最后一股脑放到照片库里。

其实日记也没多重要，丢了就丢了；对我来说，也就是换个地方存着。就跟记忆一样，很多重要的、不重要的，在某个时间点都得放到脑后；如果能想起，就想起，想不起，经历了才是最重要的。这不就是人生嘛。

> 另外，因为在整理从 Day One 搬迁到 Obsidian 的过程中，发现了以前的一些有感而发，也发现了一些有趣的互联网网站。比如这个 [PerThirtySix](https://perthirtysix.com/) 非常好的 FiveThirtyEight 的精神继承者。
