+++
title = "Changelog"
menu = "not-main"
+++

# <pre>changelog</pre>

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
