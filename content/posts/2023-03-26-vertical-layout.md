+++
title = "不合适"
slug = "vertical-layout"
date = "2023-03-26"
description = "一次在 Hugo 中尝试使用竖排版的失败经历。"
tags = ["没事折腾"]
+++

考虑给自己的中文博客添加竖排版的支持，类似[一天世界](https://blog.yitianshijie.net/)在每一篇博文后给出的[竖排版](https://tategaki.github.io/en/)选项。于是给自己的 hugo 主题增添了对于文本类别的判断——`zh` 内容会加载额外的 CSS style. 简单的解决方法如下：

```html
<style>
    body {
        text-orientation: mixed;
        writing-mode: vertical-rl;
    }
</style>
```

几个问题：

然而在测试的时候碰到了几个问题：

- 除去正文内容，navigation 和 footer 怎么办？如果保留它们原本的 orientation，那么开始阅读的位置非常不合理。

<p align="center">
    <img src="/images/zh/vertical-layout-1.jpg" alt="Vertical layout 1." style="width: 75%;" />
</p>

- 英文字符和阿拉伯数字怎么处理？竖排很难阅读。横排如果太长也无法阅读。

<p align="center">
    <img src="/images/zh/vertical-layout-2.jpg" alt="Vertical layout 3." style="width: 75%;" />
</p>

<p align="center">
    <img src="/images/zh/vertical-layout-3.jpg" alt="Vertical layout 3." style="width: 75%;" />
</p>

都是问题。

暂时把这些修改都注释掉了。如果之后有时间，单独再研究一下如何制作 hugo 的竖排版主题吧；用自己的博客做试验似乎有些不合适。
