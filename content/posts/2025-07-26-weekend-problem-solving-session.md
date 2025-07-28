---
title: "KOReader 和 Stokke Tripp Trapp screw"
date: 2025-07-26T21:50:21-04:00
slug: "weekend-problem-solving-session"
description: "Calibre 和 KOReader 的同步问题，以及螺丝滑丝问题。"
tags: ["没事折腾", "捣鼓硬件"]
---

周末的解决问题两则：

之前从 Kindle 逃离的时候把购买过的图书都下载了下来并且进行了 DeDRM, 最近在把图书导入 Kobo 的时候碰到了一个小 bug: 即便通过 calibre 从本地资料库把书籍传输到了 Kobo 的存储空间里，断开连接后再次连接并打开 calibre，发现那些新导入的图书还是不「存在」于设备里。但如果通过 Finder 查看 Kobo 的存储空间，刚传输的书籍确实是存在的。

奇怪。

最后发现错误的地方在于——**我是在 KOReader 里打开 Kobo 的 USB 传输模式的，正确的做法是在 Kobo 的主页面打开 USB 模式，**这样传过去的图书在 calibre 中才会被认出来的。其原理是图书的信息 metadata （具体位置为`/Volumes/KOBOeReader/.kobo/KoboReader.sqlite`）会在 Kobo 页面传输的时候重新构建一遍。如果操作是在 KOReader 里，则不会更新 `KoboReader.sqlite`

另外，KOReader 的标注导出会保存到 `/Volumes/KOBOeReader/.adds/koreader/clipboard/`. 两者都是隐藏路径，可以用快捷键 <kbd>cmd</kbd> + <kbd>shift</kbd> + <kbd>.</kbd> 开关隐藏文件。

下午安装婴儿成长椅，型号是 [Stokke Tripp Trapp](https://www.stokke.com/USA/en-us/category/high-chairs/stokke-high-chair-bundles)，其中给的一个螺丝似乎有点滑丝，放在哪里都安装不上去，平头扳手转几圈就会有「哗啦」一下卸了劲儿的滑动，基本来说就是废了。周末客服不上班；官网如果要下单一整个 [screw set](https://www.stokke.com/USA/en-us/spare-parts/spare-parts-highchairs/527500.html) 的话要 $12.

这时候就要感谢 reddit 网友了，早有人碰到过[类似的问题](https://www.reddit.com/r/beyondthebump/comments/16bhhgs/stokke_tripp_trapp_screws/)，并且给出了解决方案——五金店、平头、M5-0.8mm-35mm. 我大概知道 M5 是螺母大小[^1]，35mm 是螺丝长度，0.8mm [^2]则是超出了我的认知。

[^1]: M 是 metric，5 是螺母外径（直径）。

[^2]: 0.8mm 是 thread pitch，俗称「螺距」即每一个槽之间的距离。

于是我照猫画虎跑去不远的「家得宝」买了零件，果然一蹴而就完成安装。

其实每天能解决一两件小事还挺有成就感的，但挤压的要做的事情太多了多少有点杯水车薪了。（说实话看到自己 Things 里存了许久的待办事项和 GoodLinks 的未读文章，总有一种「早干吗去了」的自问。）但这是另外一天需要自己想想的话题了。
