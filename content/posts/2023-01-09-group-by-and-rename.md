+++
title = "如何同时使用 `group_by` + `rename`"
date = "2023-01-09"
description = "介绍在 R 语言中使用 dplyr 包同时进行分组和重命名列的高级技巧。"
tags = ["代码经验"]
+++

<details>
<summary>原文 How to do group_by() + rename() at the same time</summary>
TIL (technically, it's not *today*. But I found this in my notes last semester, and I think it's worth sharing):

```r
output$tbl2 <- renderDT(
    hwm %>%
      group_by(
        State = stateName,
        Type = hwm_environment) %>%
      summarize(...)
```

This is a very useful trick. It's a bit like `dplyr::rename`, but it's more flexible. You can use it to rename columns, while grouping by one or more columns.
</details>

<mark>以下为 GPT-4o 翻译内容：</mark>

TIL（技术上这不是*今天*的。但是我在我的课件上最近找到了这个，所以我觉得值得分享）：

```r
output$tbl2 <- renderDT(
    hwm %>%
      group_by(
        State = stateName,
        Type = hwm_environment) %>%
      summarize(...)
```

这是一个非常有用的技巧。它就像 `dplyr::rename` 一样，但是更灵活。你可以使用它来重命名列，同时分组一个或多个列。
