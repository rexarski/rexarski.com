+++
title = "Changelog"
menu = "not-main"
layout = "changelog"
+++

# <pre>changelog</pre>

- 2026-03-23
  - 全站样式维护：`/posts` 列表与首页「最近更新」版式统一，年标题下日期为月-日；热力图色阶改为 CSS 变量、暗色 token 收敛、暗色下隐藏顶条强调线；Google Fonts 改为 `baseof` 中 preconnect + stylesheet 加载
  - Now：进度区增加「当年进度」条；文末增加可折叠的过往 now 时间线（`data/now_history.yaml` + `now_history` shortcode）
- 2026-03-08
  - 关于页与 changelog 页完成一轮视觉收束：引入终端化展示语言，统一字形、屏幕质感、列表符号与页面节奏
  - 重写了 about 页面多处样式
- 2026-03-04
  - 样式大改：设计 token（暖色色板、--surface）、全站颗粒层与 2px 顶条、正文与标题版式、导航与 RSS 样式、博文列表动效、Now 页热力图等、暗色模式适配
- 2026-02-23
  - 新增字标与站点描述、导航与暗色模式、页脚链接、顶部强调条与版式、dithering/关系图/RSS/下划线等
  - 删除或简化纯文字标题、首页问候语、Now 页旧列表、链接与变量
- 2025-12-28
  - 移除了 NeoDB 进度展示功能及相关 shortcode、数据文件和 GitHub Actions 自动更新
  - 简化了首页 postslist 样式，移除了 description 和分割线
- 2025-10-26
  - 增加了基于 Ollama 的文章向量脚本，支持增量更新并输出相关博文数据
  - single post 模板默认展示「相关博文」，统一使用中文标题并读取生成的缓存
- 2025-10-25
  - 删除了 vertical layout
  - Atkinson Hyperlegible 替换为了 Atkinson Hyperlegible Next
- 2025-10-19
  - 首页 postslist 最近更新显示文章数从 3 变成了 7
- 2025-10-14
  - 简化了 toolbox 的重装系统的操作
  - 在自动暗色模式的基础上增加了手动调节的选择
- 2025-10-08
  - 简化了 footer 和 nav
  - 增加了对于自动化获取 Concept2 划船数据的相关内容
- 2025-09-07
  - single post 页面增加了对于 frontmatter 里 description 的渲染 (tl;dr)
- 2025-07-27
  - now 页面增加了喜爱的独立博客
- 2025-07-26
  - 给过去的博文增加了 description
  - 简化了首页布局，增加了 about 页面
  - 重新设计了最近更新区域，采用最近三篇文章展示模式，包含日期、标题和描述信息
- 2025-07-15
  - 简化了博客列表页面，移除了"近期"分类，统一按年份分组显示
  - 修复了页面布局偏移问题，通过强制显示滚动条保持一致的页面宽度
- 2025-07-13
  - 统一了博客列表页和首页文章列表的日期格式为 "2006 · 01"
  - 增加了 `minimalist-list` 中日期和标题之间的间距 (`margin-right: 2rem`)
- 2025-06-29
  - 单篇博客添加了前进和后退的导航按钮
  - RSS 链接从导航栏移到了 footer
  - 优化了文章列表显示，现在会动态显示最近 7 篇
  - 博客列表除去近 12 个月的文章剩下都会按年份归类
- 2025-05-26
  - 参考 [Roger Steve Ruiz](https://write.rog.gr/writing/table-of-contents-for-your-hugo-pages/) 增加了对于页面内目录的支持（使用 \{\{< toc >\}\}）即可调用
  - 删除了 footer 中 wavefont 的彩蛋，修改了若干字体样式
- 2025-05-14
  - 重新规划了文章的标签，保证文章单篇只有一个四字标签；且在文章列表页的标签按数量从高到低排列
- 2025-05-09
  - 增加了两个顶级页面: [toolbox](/toolbox) 和 [how2home](/how2home)
- 2025-04-09
  - 添加了 Changelog （本页面）
  - 用 [Mastodon embed timeline widget](https://gitlab.com/idotj/mastodon-embed-timeline) 配置了「闲话」显示我的 Mastodon 时间线
  - 将展示 neodb 在读内容的 shortcode 从 API 动态显示改为了「脚本抓取 + json 渲染」的本地处理方式
