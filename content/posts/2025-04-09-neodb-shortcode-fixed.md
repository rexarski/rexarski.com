+++
title = "将 NeoDB 记录整合到 Hugo 中（修正版）"
date = "2025-04-09"
slug = "neodb-shortcode-fixed"
description = "neodb -> Hugo but better"
tags = ["hugo", "neodb"]
+++

[上一篇]({{< ref "posts/2025-04-07-neodb-shortcode.md" >}})中我们其实碰到了一个问题，虽然理论上我们认为 Cloudflare 上部署的 worker 会动态抓取 API 提供的数据，但总会存在这样那样的问题——其表现形式就是 neodb shortcode 并不会更新[^1]。

[^1]: 我去看了一下 hcplanetern 的文章，发现 ta 的列表和实际的 neodb profile 也是不同步的。

另外参考了[大大的小蜗牛](https://www.eallion.com/)的方案[^2]，但是简化了一些步骤，因为我不需要所有 fancy 的外观，只需要拿到 in progress 的三个类别的数据就可以渲染成一个我需要的列表了，甚至没有任何的额外样式可言。

[^2]: [NeoDB API创建观影页面](https://www.eallion.com/neodb/)

具体步骤如下：

## Bearer Token 保存到本地环境中

```bash
echo ".env" >> .gitignore
echo 'NEODB_BEAR_TOKEN="*********"' > .env
```

## shell 脚本抓取数据

只需要 `id`、`title` 和 `created_time` 三个字段就可以了，其他的都不需要。

```bash
source .env

# Fetch and process book data
curl -X 'GET' 'https://neodb.social/api/me/shelf/progress?category=book&page=1' \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $NEODB_BEARER_TOKEN" | \
    jq '{data: [.data[] | {id: .item.id, title: .item.title, created_time: .created_time}]}' > ./assets/data/book_in_progress.json

# Fetch and process TV data
curl -X 'GET' 'https://neodb.social/api/me/shelf/progress?category=tv&page=1' \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $NEODB_BEARER_TOKEN" | \
    jq '{data: [.data[] | {id: .item.id, title: .item.title, created_time: .created_time}]}' > ./assets/data/tv_in_progress.json

# Fetch and process game data
curl -X 'GET' 'https://neodb.social/api/me/shelf/progress?category=game&page=1' \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $NEODB_BEARER_TOKEN" | \
    jq '{data: [.data[] | {id: .item.id, title: .item.title, created_time: .created_time}]}' > ./assets/data/game_in_progress.json
```

三者分别存到 `./assets/data/` 中；一般来说如果同时在读/看/玩的项目不是很多，不超过一页的情况下不需要循环读取每页的内容。所以这里理论上是有 edge case 需要考虑的，但是这里就忽略了。

## 更新 neodb shortcode

在 `layouts/shortcodes/neodb.html` 中，直接读取 `./assets/data/` 中的 json 文件，渲染成一个列表就可以了。

```html
{{ $category := .Get "category" }} {{ $jsonFile := resources.Get (printf
"data/%s_in_progress.json" $category) }} {{ $data := $jsonFile.Content |
transform.Unmarshal }}

<ul>
    {{ range $data.data }}
    <li>
        <a href="{{ .id }}">{{ .title }}</a>
        <span>({{ .created_time | time.Format "2006-01-02" }})</span>
    </li>
    {{ end }}
</ul>

```

最后在 now 页面中用 `\{\{< neodb category="book|game|tv" >\}\}` 直接调用就可以了。同样别忘记删除此处的反斜杠。

## 写一个 pre-commit hook

在 commit 前需要自动运行先前定义的脚本，确保数据是最新的。

```bash
cd .git/hooks
touch pre-commit
chmod +x pre-commit
```

在 `pre-commit` 中写入以下内容：

```bash
# !/bin/bash
# Run the neodb_data.sh script before committing/pushing
/bin/bash ./neodb_data.sh

# Exit with success
exit 0
```
