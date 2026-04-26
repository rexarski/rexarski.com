+++
title = "4. KOReader"
weight = 4
+++

# KOReader（Kobo）配置备忘

{{< toc >}}

整理自站内相关记录（如 [Kobo KOReader 重装](/posts/kobo-koreader-reset/)、[字典](/posts/add-dictionary-to-koreader/)、[Calibre 与 USB](/posts/weekend-problem-solving-session/)），方便以后重装或换机时一页看完。**设备以 Kobo + KOReader 为主**；其他机型安装路径见 [官方 Wiki](https://github.com/koreader/koreader/wiki)。

updated on 2026-04-26

## 重装前备份

- 备份 **字典**、**笔记/标注** 等个人数据，再执行恢复出厂或覆盖安装。
- Kobo 官方重置说明可参考：[Manual reset Kobo Clara Colour & Kobo Clara BW](https://help.kobo.com/hc/en-us/articles/18332008301719-Manual-reset-Kobo-Clara-Colour-Kobo-Clara-BW)。

## 安装与更新

- 官方文档：[Installation on Kobo devices](https://github.com/koreader/koreader/wiki/Installation-on-Kobo-devices)
- 社区常用入口：
  - [One click install package（MobileRead）](https://www.mobileread.com/forums/showpost.php?p=3797095&postcount=1)
  - [Install script（MobileRead）](https://www.mobileread.com/forums/showpost.php?p=3797096&postcount=2)
- 装好后可用 **OTA** 跟到当前稳定版（升级前同样建议备份）。

## Calibre 与 USB 传输（易踩坑）

- **必须在 Kobo 原生首页进入 USB 传输模式**，不要在 KOReader 里开 USB。否则 Calibre 可能认不出刚传的书——因为设备侧的 **`KoboReader.sqlite`**（例如 macOS 上常见为 `/Volumes/KOBOeReader/.kobo/KoboReader.sqlite`）需要在 **Kobo 系统界面** 连接时才会按预期更新；在 KOReader 下连接则不会完整更新这份库信息。
- 隐藏目录在 Finder 里可用 <kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>.</kbd> 切换显示。

## 字典

- 词典来源示例：[reader.dict](https://www.reader-dict.com/)（基于 Wiktionary；单语免费，双语为一次性付费）、以及社区分享的词典包（如 Reddit 讨论中的 Oxford 等，自行甄别版权与来源）。
- **安装路径（Kobo）**：在 `/Volumes/…` 下进入 **`.adds/`** 中 KOReader 的数据目录，将词典文件放入 **`data/dict/`**（具体层级以你设备上实际路径为准，可用终端 `find` 辅助定位）。
- 官方说明：[Dictionary support](https://github.com/koreader/koreader/wiki/Dictionary-support)

## 字体与图书元数据

- **KOReader 内字体**：将字体文件放入 KOReader 的 fonts 目录（与安装方式一致，通常在 `.adds/koreader/` 下对应位置）。
  - **更多桌面端字体列表**见本站 [toolbox · 字体](/toolbox/fonts/)。
- **Calibre**（与书库质量相关，间接影响推到阅读器上的体验）：
  - [Calibre 推荐配置与插件 - 雅余](https://yayu.net/4767.html)
  - [Cirn09/calibre-do-not-translate-my-path](https://github.com/Cirn09/calibre-do-not-translate-my-path)
  - [fugary/calibre-douban](https://github.com/fugary/calibre-douban)

## Plugin

- [SimpleUI for KOReader](https://github.com/doctorhetfield-cmd/simpleui.koplugin)
- [Bookends](https://github.com/AndyHazz/bookends.koplugin)

## User patches

官方说明：[User patches](https://koreader.rocks/user_guide/#L2-userpatches)（`koreader/patches/` 目录，文件名与优先级规则见文档）。

个人在用/曾用组合（可按发行版与兼容性自行增减）：

1. **[SeriousHornet/KOReader.patches](https://github.com/SeriousHornet/KOReader.patches)**
   - `20-faded-finished-books.lua`
   - `2-new-progress-bar-colored.lua`
   - `2-percent-badge.lua`
2. **[omer-faruq/koreader-user-patches](https://github.com/omer-faruq/koreader-user-patches)**：**Book receipt shortcut and lockscreen**

灵感参考：[r/koreader 展示帖](https://www.reddit.com/r/koreader/comments/1osqlxf/show_your_koreader_ui/)。

> **提示**：大版本升级后若出现奇怪黑屏或退出卡顿，优先排查是否手滑覆盖错文件；必要时干净重装 + 按上表逐步恢复补丁。

## 路径速查（macOS 挂载 Kobo 时）

| 用途 | 典型路径（卷名因设备而异） |
|------|---------------------------|
| Kobo 书库数据库 | `/Volumes/KOBOeReader/.kobo/KoboReader.sqlite` |
| KOReader 标注等剪贴板导出 | `/Volumes/KOBOeReader/.adds/koreader/clipboard/` |
| KOReader 数据根目录 | `/Volumes/KOBOeReader/.adds/koreader/`（其下含 `data/dict/` 等） |

## 延伸阅读

- [KOReader Releases](https://github.com/koreader/koreader/releases)
