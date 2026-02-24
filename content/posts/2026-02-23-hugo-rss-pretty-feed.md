---
title: "如何美化 Hugo 的 RSS"
date: "2026-02-23T10:00:00-05:00"
slug: "hugo-rss-pretty-feed"
description: "用 XSL 把 feed 在浏览器里变成可读页，范例和参考交给 agent 搞定。"
tags: ["没事折腾"]
draft: false
---

有人会在浏览器里直接点开你的 RSS 地址，结果满屏 XML，一点也不像你网站该有的样子。其实可以用 XSL 把 feed 转成一张正常网页：返回链接、订阅说明、可复制的 feed 地址、近期文章列表，都有了。

我懒得自己写 XSL，就找了两个明确的范例：**做法**看 [Cassidy Williams 的 gist](https://gist.github.com/cassidoo/9b6afeb92350bfbeccc7f968fbe89e5f) 和她站上的 [RSS 页](https://cassidoo.co/rss.xml)（效果一目了然）；**风格**想活泼一点，就给了 [Playdate 官网](https://play.date/dev/) 当参考。把「要达成什么、照着谁的范例、视觉参考谁」说清楚，交给 agent，它去改 Hugo 的 RSS 模板、写 `static/pretty-feed.xsl`、对齐 Playdate 那种黄底白卡片粗黑边，我就验收一下。省事，效果也不错。

真要自己动手的话，About Feeds 的 [pretty-feed 说明](https://github.com/genmon/aboutfeeds) 和 gist 里的思路都够用；若你也是「给范例、交给 agent」派，直接把这几个链接丢过去就行。
