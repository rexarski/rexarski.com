+++
title = "如何在 Hugo 中添加行内键盘按键和高亮显示"
date = "2023-02-23"
description = "介绍在 Hugo 博客中为键盘按键和高亮文本添加自定义样式的方法，包括 CSS 配置和用法。"
tags = ["没事折腾"]
+++

Yihui's latest [blog post](https://yihui.org/en/2023/02/key-buttons/) on styling keyboard keys and shortcuts revealed a brutal fact to me: I've been misusing the `<pre>`, `<kbd>`, and `<code>` tags for years. The inline code markdown syntax really spoiled me. I tend to overuse inline code a lot ~~and do not want to aggressively replace the syntax with `<kbd>` tag single-handedly~~[^1], so I decide to differentiate them by creating separate styles.

[^1]: Apparently, I misunderstood the post: the [JavaScript code](https://github.com/yihui/misc.js/blob/main/js/key-buttons.js) works only some designated keys are surrounded by `<code>` tags.

## <kbd>Keys!</kbd>

First, we need to enable raw HTML support in Hugo by adding the following to `config.toml`:

```toml
[markup.goldmark.renderer]
unsafe = true
```

Then, we can add the following CSS to your dedicated CSS file. (For hugo-bearblog, it's inside `style.html`)

```css
kbd {
    border: 2px solid #ccc;
    box-shadow: 2px 2px #999;
    display: inline-block;
    padding: 0 5px;
    border-radius: 0.25em;
    min-width: 1.5em;
    text-align: center;
    margin-right: 0.15em;
}

kbd:hover {
    position: relative;
    top: 2px;
    left: 2px;
}
```

<kbd>Command</kbd>
<kbd>Shift</kbd>
<kbd>R</kbd>

<kbd>It looks pretty compatible with the dark theme too.</kbd>

## <mark>Highlights!</mark>

Another idea just popped up in my mind: I really want the highlighting syntax `==highlighted==` to be usable in Hugo. Now I can at least use `<mark>` tag as a workaround.

```css
mark {
    background-color: #98ff98;
    color: #333;
}

@media (prefers-color-scheme: dark) {
    mark {
        background-color: gold;
        color: #333;
    }
}
```

This should be a good start to make the highlights look different from default highlighting.

Ideally, it's better to render `==highlighted==` as `<mark>`. <mark>And I'll try to implement it in the future</mark>.
