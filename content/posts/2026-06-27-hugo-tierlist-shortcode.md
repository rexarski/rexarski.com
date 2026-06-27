---
title: Hugo TierMaker shortcode
date: 2026-06-27T10:30:00-04:00
slug: hugo-tierlist-shortcode
description: 纯 CSS tier list。
tags:
  - 没事折腾
---

两个短代码：`tierlist` + `tier`，输入体验接近 markdown 列表。tier 用 <code>{&#37; %}</code> 包裹，内容自动渲染。

## 怎么用

```
{{</* tierlist palette="tiermaker" */>}}

{{%/* tier name="S" */%}}
- ![img](/img/a.png) [Thing 1](https://a.com)
- [Thing 2](https://b.com)
- Plain text
{{%/* /tier */%}}

{{%/* tier name="A" */%}}
- [Another](https://c.com)
{{%/* /tier */%}}

{{</* /tierlist */>}}
```

`palette` 可选 `tiermaker`（7 色）、`coffee`（棕色调），不传则全部灰色。颜色按 tier 出现顺序自动分配，tier 数量不限。

## 实际效果

### 彩色版（`palette="tiermaker"`）

{{< tierlist palette="tiermaker" >}}

{{% tier name="S" %}}
- ☕ Espresso
- [James Hoffmann](https://www.youtube.com/@jameshoffmann)
{{% /tier %}}

{{% tier name="A" %}}
- 手冲 V60
- [Aeropress](https://aeropress.com)
- Flat white
{{% /tier %}}

{{% tier name="B" %}}
- Cold brew
- Moka pot
{{% /tier %}}

{{% tier name="C" %}}
- 打发美式
- 胶囊咖啡
{{% /tier %}}

{{< /tierlist >}}

### 无色版（不传 `palette`）

{{< tierlist >}}

{{% tier name="S" %}}
- ☕ Espresso
- [James Hoffmann](https://www.youtube.com/@jameshoffmann)
{{% /tier %}}

{{% tier name="A" %}}
- 手冲 V60
- Flat white
{{% /tier %}}

{{% tier name="B" %}}
- Cold brew
- 打发美式
{{% /tier %}}

{{< /tierlist >}}

### 带图片版

{{< tierlist palette="coffee" >}}

{{% tier name="S" %}}
- ![img](/images/favicon.png) Espresso
- ![img](/images/favicon.png) [James Hoffmann](https://www.youtube.com/@jameshoffmann)
{{% /tier %}}

{{% tier name="A" %}}
- ![img](/images/favicon.png) 手冲 V60
- Flat white
{{% /tier %}}

{{< /tierlist >}}
