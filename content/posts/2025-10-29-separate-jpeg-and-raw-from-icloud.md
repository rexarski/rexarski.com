---
title: "从iCloud 中拆分 RAW 和 jpeg 格式的照片"
date: 2025-10-29T11:21:55-04:00
description: "没想到添加的时候容易，导出的时候却麻烦得紧。"
slug: "separate-jpeg-and-raw-from-icloud"
tags: ["日日谈"]
---

# 拆分 iCloud 里的 RAW 和 jpeg 格式照片

简单来说就是同名的两个格式的照片如果一起导入了，会将照片合并在一起，一个作为 original file 一个作为它的 variant 版本。导出的时候则没有办法只导出它的一个格式，也没有办法只删除它的一个格式。

所以，只能进行如下操作：

- 勾选 View - Metadata - File Type 这样在搜索的时候就可以选出带有 RAW 格式的照片
- 搜索栏找出所有带 RAW 格式的照片，全选并通过 File - Export - Export Unmodified Original for X Photos
- 因为我没有在 Photos 里进行标题等 metadata 的修改，就不用选择 Export IPTC as XMP 了
- 导出之后把 jpeg 和 RAW 格式手动分开
- iCloud 里可以删除整个所有 RAW 格式的照片
- 最后再把手动分开的 jpeg 导入回 Photos

烦人的是：如果删除的照片原本在 shared library 或者某个相册里，之后还得一点一点加回来。
