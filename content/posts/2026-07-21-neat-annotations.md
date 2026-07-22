---
title: Neat annotations
date: 2026-07-21T21:00:00-04:00
slug: neat-annotations
description: 给正文加手绘箭头和手写标签。
tags:
  - 没事折腾
---

看到 [neat-annotations](https://github.com/syabro/neat-annotations)：纯 CSS，一个文件，没有 JS，没有构建步骤，就能给网页里任意一段文字画上手绘箭头 + 手写标签。刚好适合往博客里塞。

## 怎么接的

两步。

一是把 `neat-annotations.css` 下载到 `assets/css/`，跟着 `main.css` 一起走 Hugo Pipes——`minify | fingerprint` 后在 `style.html` 里多加一个 `<link>`。本地文件，不挂 CDN。

二是包了个 `ann` 短代码，省得在 markdown 里手写 `<span class="ann …">`。原库的调用长这样：

```html
<span class="ann ann-n ann-amber" data-note="不用刷新">实时更新</span>
```

短代码把它压成一行（放心地写在句子中间，goldmark 不会把它拆到新段落）：

```
{{</* ann dir="n" color="amber" note="不用刷新" */>}}实时更新{{</* /ann */>}}
```

`dir` 是箭头方向（`n` / `ne` / `e` / `se` / `s` / `sw` / `w` / `nw`）；`color` 传内置六色（amber / blue / green / red / purple / rainbow）就套类名，传别的（比如 `#ff1493`）就自动落到 `--ann-color`；`note` 省掉就只当记号笔，不画箭头。

还有个小坑：原库用 `light-dark()` 决定高亮底色，而本站的暗色是靠 body class 切的、没设 `color-scheme`。所以在 `main.css` 里补了一条，暗色时给 `.ann` 挂上 `color-scheme: dark`，让 `light-dark()` 落到深色那支。vendored 的文件本身没动。

## 实际效果

先提醒一句：标签是绝对定位画在文字外面的、**不占版面**，所以给带箭头的批注留白很重要——挤在密排的正文行里，标签会跟上下行、跟右边的字叠在一起。下面每组都是「源码 → 效果」对照，箭头批注也都单独留了空间。

### 基本：箭头 + 标签

```
仪表盘会 {{</* ann dir="n" color="amber" note="不用刷新" */>}}实时更新{{</* /ann */>}}，你什么都不用做。
```

<div class="ann-demo-row">
仪表盘会 {{< ann dir="n" color="amber" note="不用刷新" >}}实时更新{{< /ann >}}，你什么都不用做。
</div>

### 八个方向

`dir` 取 `n` / `ne` / `e` / `se` / `s` / `sw` / `w` / `nw`，箭头指向目标、标签落在反方向。单个长这样：

```
{{</* ann dir="n" note="正北" */>}}n{{</* /ann */>}}
```

八个一起（拉开间距，免得标签打架）：

<div class="ann-demo-grid">
{{< ann dir="nw" note="西北" >}}nw{{< /ann >}}
{{< ann dir="n" note="正北" >}}n{{< /ann >}}
{{< ann dir="ne" note="东北" >}}ne{{< /ann >}}
{{< ann dir="w" note="正西" >}}w{{< /ann >}}
{{< ann dir="e" note="正东" >}}e{{< /ann >}}
{{< ann dir="sw" note="西南" >}}sw{{< /ann >}}
{{< ann dir="s" note="正南" >}}s{{< /ann >}}
{{< ann dir="se" note="东南" >}}se{{< /ann >}}
</div>

### 颜色

内置六色纯高亮、不画箭头，所以能放心写进正文，不用留白：

```
<div class="ann-demo-row" style="padding: 1rem 0;">
{{</* ann color="green" */>}}green{{</* /ann */>}}
</div>
```

<div class="ann-demo-row" style="padding: 1rem 0;">
{{< ann color="amber" >}}amber{{< /ann >}} · {{< ann color="blue" >}}blue{{< /ann >}} · {{< ann color="green" >}}green{{< /ann >}} · {{< ann color="red" >}}red{{< /ann >}} · {{< ann color="purple" >}}purple{{< /ann >}} · {{< ann color="rainbow" >}}rainbow{{< /ann >}}
</div>

想要别的颜色，直接给色值，`ann` 会把它落到 `--ann-color`。带箭头，所以同样留白：

```
<div class="ann-demo-row">
{{</* ann dir="s" color="#ff1493" note="想咋定咋定" >}}热粉{{< /ann */>}}
</div>
```

<div class="ann-demo-row">
{{< ann dir="s" color="#ff1493" note="想咋定咋定" >}}热粉{{< /ann >}}
</div>

### 记号笔

`dir` 和 `note` 都不传，就退化成一支只高亮、不画箭头的记号笔：

```
<div class="ann-demo-row" style="padding: 1rem 0;">
把 {{</* ann color="rainbow" >}}关键几个字{{< /ann */>}} 标出来。
</div>
```

<div class="ann-demo-row" style="padding: 1rem 0;">
把 {{< ann color="rainbow" >}}关键几个字{{< /ann >}} 标出来。
</div>

（`rainbow` 会循环变色，但尊重 `prefers-reduced-motion`——系统开了减弱动态，它就不动了。）

## 一个 RSS / 无障碍的坑

标签的文字不是真的文字——它是 CSS 用 `::after { content: attr(data-note) }` 画出来的。所以但凡 CSS 被剥掉的地方（RSS、阅读器模式、读屏软件），箭头、高亮、连同标签一起消失，只剩下目标那个词。「实时更新」还在，「不用刷新」没了。

补法：让 `ann` 在输出目标文字之后，多塞一个 `sr-only`（视觉隐藏）的 `.ann-note`，把标签作为**真文字**写进 DOM。带 CSS 时它被藏起来、只看手写标签；没 CSS 时它现形，读作「实时更新（不用刷新）」。读屏也顺带受益。

```
<span class="ann …" data-note="不用刷新">实时更新<span class="ann-note">（不用刷新）</span></span>
```

顺带一提，本站 RSS 只发 `.Summary`，摘要在「实际效果」之前就截断了，订阅者其实看不到上面这些 demo——这条 fallback 更多是给读屏和「万一摘要变长」上的保险。
