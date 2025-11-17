---
title: "Kobo KOReader Setup"
date: 2025-11-16T20:44:17-05:00
description: "下次记得不要乱手动更新覆盖重要文件。"
slug: "kobo-koreader-reset"
tags: ["日日谈"]
---

[10月份的 KOReader 更新](https://github.com/koreader/koreader/releases/tag/v2025.10)害我不小心搞砸了 Kobo 里的文件，结果每次退出在读图书都会陷入一个长久的黑屏，使用体验非常差劲。索性重新恢复出厂设置并再配置一次 KOReader.

- 第一步：备份 koreader 里的字典、笔记
- 第二步：[Manual reset Kobo Clara Colour & Kobo Clara BW](https://help.kobo.com/hc/en-us/articles/18332008301719-Manual-reset-Kobo-Clara-Colour-Kobo-Clara-BW)
- 第三步：
  - [Installation on Kobo devices - koreader/koreader GitHub Wiki](https://github-wiki-see.page/m/koreader/koreader/wiki/Installation-on-Kobo-devices)
    - [One click install package](https://www.mobileread.com/forums/showpost.php?p=3797095&postcount=1)
    - [Install script](https://www.mobileread.com/forums/showpost.php?p=3797096&postcount=2)
- 第四步：OTA update to current version (2025.10)
- 第五步：安装以下内容
  - [字典 reader.dict](www.reader-dict.com/)
  - fonts
  - [joshuacant/ProjectTitle](https://github.com/joshuacant/ProjectTitle)
  - [Calibre 推荐配置与插件 - 雅余](https://yayu.net/4767.html)
    - [Cirn09/calibre-do-not-translate-my-path](https://github.com/Cirn09/calibre-do-not-translate-my-path)
    - [fugary/calibre-douban](https://github.com/fugary/calibre-douban)
- 2025-11-10 更新 第六步：安装额外的 [user patches](https://koreader.rocks/user_guide/#L2-userpatches). Inspired by [this reddit post](https://www.reddit.com/r/koreader/comments/1osqlxf/show_your_koreader_ui/)
  - [GitHub - SeriousHornet/KOReader.patches: Some of the patches I created for KOReader.](https://github.com/SeriousHornet/KOReader.patches)
  - and this additional user patch with **[book receipt shortcut and lockscreen](https://github.com/omer-faruq/koreader-user-patches)**.

我非常喜欢最后那个锁屏封面的效果，该有的内容都有，而且非常鼓励我接着回去把书读完。
