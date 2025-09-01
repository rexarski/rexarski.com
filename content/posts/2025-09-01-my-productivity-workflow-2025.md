---
title: "信息流 (2025)"
date: 2025-09-01T00:06:13-04:00
description: "感觉自己在废话，但是就当是给 2025.8 当下的自己的数字生活做一个硅基的备份好了。"
slug: "my-productivity-workflow-2025"
tags: ["没事折腾"]
---

> GTD、Read‑it‑later 以及由 FOMO 驱动的数字生活。

本来只是想梳理一下自己最近两年的 GTD 系统，但一写就联想到信息摄取，索性放在一起聊。这篇文章的核心，是梳理信息在我日常数字生活中的流转路径：

	1.	[信息源] → Reeder → GoodLinks/Instapaper → [归档]
	2.	[信息源] → Reeder → Drafts + 思考 → Obsidian 日志
	3.	[信息源] → Reeder → Drafts + 思考 → iA Writer → Working Copy → 博客
	4.	[思考]/[纸笔] → Things → 日历/提醒/Due
	5.	[书籍/电影/音乐/游戏] → Drafts + 评论 → Obsidian → NeoDB 记录
	6.	[美剧/动画] → Sequel 剧集跟踪 → NeoDB 记录

下文中的内容并非深刻的理论，大多是我在形成上述路径时的个人经验。不过有几条原则值得分享：

- **内容大于形式，工具只是手段，过度折腾工具本身是陷阱。**
- **如果怀疑某件事是否必要，那往往就是不必要。**
- **信息过载不可避免，所以要定期「大剪枝」。**
- **别人说好的不一定适合你，批判性接受他人推荐。**

{{< toc >}}

## GTD

### 核心需求

1. 需要强提醒，把必须做的事「怼」到脸上；  
2. 需要日程规划，一目了然；  
3. 需要 backlog，存储各种想法并方便回顾；  
4. 需要记录读书、观影、追剧进度。

基于这些需求，我的工具组合是：Things、日历/提醒/Due、Sequel/NeoDB 等。

### Things

<mark>[Things](https://culturedcode.com/things/)</mark> 依旧是我的主力应用，不过现在对 Projects 和 Tags 的使用更为轻量化。留在 Things 的原因是熟练的快捷键和优雅的外观。对我而言，Things 更适合中长期规划和 backlog，相当于一个「中长期 Todo Hub」；每天必须完成的事情则放在日历或 Due 里。Things 的优点在于输入迅速、同步可靠，这点对于维护我的 backlog 至关重要。

### 日历＋提醒＋ Due

曾经使用 Fantastical，但逐渐回归到原生日历＋提醒＋Due 的组合。原生工具不需要额外账号，家庭共享更方便。Fantastical 的自然语言输入不再是硬需求。

Due 的不可替代性在于它的反复提醒功能。设置提醒时可以用可自定义按钮快速选择时间；如果事项过期，会持续弹窗，直到标记完成或重新安排。这对我这种容易拖延的人非常重要。

对习惯性任务，我会先放在 Due 中进行强化提醒，等习惯建立后再迁移到日历或提醒；这样既避免滥用强提醒，又保持系统简洁。

### Sequel + NeoDB

读书、电影、音乐、游戏等无法「一蹴而就」，把它们放到 Things 里总觉得怪怪的。我尝试了三种方法：

1. **纯文本方式**：简单、可控，但缺乏社交属性和跨平台跟踪。  
2. **利用专业社区**：比如 MusicBox 管理音乐、Sequel 管理美剧、Backloggd 管理游戏、Letterboxd 管理电影、BoardGameGeek 管理桌游等，最后通过 NeoDB 统一备份。
3. **依赖 <mark>[NeoDB](https://neodb.social/discover/)</mark> + <mark>[Sequel](https://www.getsequel.app)</mark> 记录电视剧的单集进度**：更适合「随手记录」，比较 hassle-free 一点。

从 1-3 的方法也差不多是我这一年来的尝试，目前方法 3 相对简单稳定，但随着 Obsidian Bases 核心插件的上手，我觉得可能会回到纯文本的记录方式只给自己留个备份——毕竟社交属性其实并不是我一贯追求的。

## 获取、内化与记录

### Reeder

我曾用 Feedbin＋Reeder Classic，现在主要使用 <mark>[Reeder](https://reederapp.com)</mark> 以及自带的 iCloud 一站式 intake. 新版本的 Reeder 已经不仅是 RSS 阅读器，而是综合的信息入口：它可以订阅新闻源、播客、YouTube 和 Mastodon 等内容，并提供读后标记。通过 iCloud 同步，可在各设备间无缝切换。它的优势是源内容统一、界面简洁；不足之处是无法直接添加网页链接，只能通过订阅源过滤到 Read it later 收藏夹。因此，我仍需要 GoodLinks 或 Instapaper 作为独立的 Read‑it‑later 工具。

### Obsidian

曾一度在 <mark>[Obsidian](https://obsidian.md)</mark> 中搭建复杂的文件结构体系，试图精通几个热门的 must-have plugins，但现在更趋向于减重——形式不重要，记下来内容才是王道。

之前在 <mark>[Day One](https://dayoneapp.com)</mark> 上写了十多年的日记，今年决定 pull the plug 暂停订阅只在 Obsidian 里写纯文本日记。尝试了几个自动生成日记模板的插件，最后还是返璞归真只保留自动插入日期和定制化的 tag，每天写两句流水账也挺惬意。

### GoodLinks

我在 Pinboard、Omnivore、Instapaper、Pocket 等之间辗转，最终挑选了 <mark>[GoodLinks](https://goodlinks.app)</mark>：

- GoodLinks 会提取网页正文、去除广告，提供简洁的阅读体验，并支持自定义字体、间距等。  
- 2.0 版本开始支持高亮和批注：可以在文章中划线并添加注释。
- 通过浏览器插件或分享菜单，可轻松保存文章；支持使用标签和“星标”进行分类。  
- 只需一次付费即可在 iOS 和 macOS 设备上使用，并通过 iCloud 同步，保障隐私且无需注册。  

> 不过最近有重新用回 <mark>[Instapaper](https://www.instapaper.com)</mark> 的迹象，主要还是在常用的 Kobo 上增加了对 Instapaper 对支持——凡是跳出 Apple 生态的使用场景，可能还是 Instapaper 比较方便。所以目前把那种每天「看到就想看但可能得花个 5-10 分钟，不看可惜但又不用沐浴更衣正襟危坐来捧读」的文章扔过去。目前保持在个位数的未读，很舒适。

我仍然觉得没有完美的 Read‑it‑later：Omnivore 被收购，继而关停；Pocket 也已正式关闭。所有工具都是暂时的，「Later】实际上是一种幻觉——要么现在读，要么放弃。

我理想的 Read‑it‑later 应用需要简单直观、极易输入、阅读体验干净，并能让用户决定「立即读」还是「X 天后自动删除」，最后还有一个可以全文索引的归档功能。为了实现 now or never，我给自己设定一个规则：添加进 GoodLinks 的文章只允许等待 30 天，超期未读的就删除。这样避免堆积无效信息，防止 FOMO 驱动的「囤积」。

### Drafts、iA Writer 与 Hobonichi

<mark>[Drafts](https://getdrafts.com)</mark> 是我随手记录的入口：捕捉灵感、日常碎碎念，然后分类处理。对更系统的文章，我会转入 <mark>[iA Writer](https://ia.net/writer)</mark> 进行沉浸式写作，通过 <mark>[Working Copy](https://workingcopy.app)</mark> 推送到博客仓库。

年初迷上了日本文具，买了 <mark>[Hobonichi Techo](https://www.1101.com/store/techo/)</mark>，期望通过纸质手帐加强生活记录。不过我发现自己没有时间每天「经营」手帐，于是逐渐把它当成有日期的草稿本，用来偶尔手写反思。

## FOMO

FOMO 这种用来描述社交媒体上的「感到错过某些信息」以及随后为了保持社交联系而产生的强迫行为。

在数字生活中，我们随手收藏的链接、加入的频道、订阅的播客常常是 FOMO 的产物：担心错过好文章、错过热门剧集、错过某次团购。可是，这种「预期」的消费往往带来无谓负担。我的应对策略是定期审视订阅列表，大幅减枝；对新出现的工具和服务持谨慎态度，不再因为别人的安利而试用所有应用。错过一些资讯没什么大不了——真正重要的东西会以其他方式进入你的视野。

## 终局

我曾一度认为手帐是自己的终极方案，但实践告诉我，任何需要大量装饰、整理的系统都难以长期维系。

理想的「终局工具」应该：

- 满足个人需求的同时保持简单、易复制、易迁移；  
- 不依赖某个平台或生态，最好基于通用格式（如纯文本）；  
- 不需要复杂的配置或高门槛的维护。  

目前，上面这套数字方案对我的生活方式已能很好支撑，因此折腾的欲望明显减少。但我也接受，未来如果离开 Apple 生态，可能会转向 <mark>[org‑mode](https://orgmode.org)</mark> 或纯纸笔。这个工具也或许是结合纸笔体验的电子设备，但目前，我更倾向于简单的系统：数字 + 纸笔各司其职。

最后，一句话 takeaway: **GTD 最让人舒服之处，也是其最大陷阱：把事情列下来让生活看起来井然有序，但系统只是辅助，重点在于是否真正去做，而不仅仅是写下来的瞬间获得秩序感。**
