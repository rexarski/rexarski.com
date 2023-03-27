+++
title = "group_by and rename at the same time"
date = "2023-01-09"
description = ""
tags = ["r", "tidyverse"]
+++

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
