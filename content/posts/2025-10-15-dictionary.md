---
title: "给 KOReader 加字典"
date: 2025-10-15T23:43:00-04:00
description: "又开始装潢工作了。"
slug: "add-dictionary-to-koreader"
tags: ["没事折腾"]
---

从这个[帖子](https://www.reddit.com/r/koreader/s/fEoyzgajV8)延伸过来给 KOReader 添加字典：

用的是网友提供的 Oxford 加 [**reader.dict**](https://www.reader-dict.com). 后者着重说两句：其实就是开源的 Wiktionary 所提供的词汇解释。双语需要付费，5 美元一次性，单语免费。看书完全够用了。

添加到 KOReader 里的时候还得稍微注意一下[^1]，因为是在 Kobo 里安装的 KOReader，需要找到隐藏路径，所以 terminal 里从 `/Volumes/` 一路找下去在 `/.adds/` 里找到 KOreader 的安装路径，然后是 /data/dict/` 再导入字典文件。

[^1]: 参考 [Dictionary support](https://github.com/koreader/koreader/wiki/Dictionary-support).
