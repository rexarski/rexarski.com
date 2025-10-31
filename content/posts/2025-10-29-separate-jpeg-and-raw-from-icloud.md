---
title: "拆分 iCloud 里的 RAW 和 jpeg 格式照片失败记"
date: 2025-10-30T23:21:55-04:00
description: "这次的小实验其实挺有意思的，也算是和 macOS 的照片系统打一场小仗。没想到添加的时候容易，导出的时候却麻烦得紧。"
slug: "separate-jpeg-and-raw-from-icloud"
tags: ["日日谈"]
---

![2025-10-30-photos-app-issue-thumbnail](https://raw.githubusercontent.com/rexarski/oss/main/2025-10-30-photos-app-issue.jpeg)

简单来说就是同名的两个格式的照片如果一起导入了，会将照片合并在一起，一个作为 original file 一个作为它的 variant 版本。导出的时候则没有办法只导出它的一个格式，也没有办法只删除它的一个格式。

所以，只能进行如下操作：

- 勾选 View - Metadata - File Type 这样在搜索的时候就可以选出带有 RAW 格式的照片
- 搜索栏找出所有带 RAW 格式的照片，全选并通过 File - Export - Export Unmodified Original for X Photos
- 因为我没有在 Photos 里进行标题等 metadata 的修改，就不用选择 Export IPTC as XMP 了
- 导出之后把 jpeg 和 RAW 格式手动分开
- iCloud 里可以删除整个所有 RAW 格式的照片
- 最后再把手动分开的 jpeg 导入回 Photos

烦人的是：如果删除的照片原本在 shared library 或者某个相册里，之后还得一点一点加回来。

**然而这仅仅是麻烦的开始。** 我一开始想把 RAW+JPEG 成对照片拆开，只保留 JPEG 版本；理论上这应该能「干净重置」。但奇怪的是——重新导入几秒钟后，那些看似单独的 JPEG 又被 macOS Photos 自动识别为 "JPEG+RAW" 格式。

最初的怀疑是「本地残留」或「iCloud 残影」。我写了个 AppleScript 去扫描 Photos Library Package Contents，看是否还有隐藏的 RAW 文件。

结果显示：本地并没有 RAW 文件残留。

但随后在 Photos App 自己的 Recently Deleted 里发现一段细节说明，解开了谜团：

![2025-10-30-photos-app-issue](https://raw.githubusercontent.com/rexarski/oss/main/2025-10-30-photos-app-issue.png)

> Photos and videos show the days remaining before deletion. After that time, items will be permanently deleted. This may take up to 40 days.
>
> Items that were part of your Personal Library when you created the Shared Library will be stored in iCloud for up to six months.

也就是说：

- 被删除的照片即使在「最近删除」里清空，也可能在 iCloud 上 暂存 40 天甚至半年；
- 这意味着当我重新导入 JPEG 时，iCloud 那边还 " 记得 " 同名的 RAW，于是又自动把它们配对成一组。

问题不是本地没删干净，而是云端没忘干净。

macOS Photos 的配对逻辑并不只依赖文件路径，它还会综合：

- 拍摄时间（Exif 中的 Capture Date）
- 文件名（哪怕略有差异）
- iCloud 中的照片历史记录

所以即使你导入的只是 JPEG，只要 iCloud 还保存着对应的 RAW 条目，它就会自动重新配对，让人误以为 RAW 又回来了。

彻底清除 iCloud 残留只能靠时间（40 天至半年）或完全停用 iCloud Photos 并重新启用来「重置云端缓存」。后者实在不显示——首先你需要一个足够大的本地硬盘，然后选择 Download Originals to this Mac.

Apple 这软件逻辑不靠谱啊。¯\_(ツ)_/¯
