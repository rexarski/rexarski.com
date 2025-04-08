+++
title = "将 NeoDB 记录整合到 Hugo 中 (2025)"
date = "2025-04-07"
slug = "neodb-shortcode"
description = "neodb -> Hugo"
tags = ["hugo", "neodb"]
+++

结合了这两篇：

- hcplanetern 的[将 NeoDB 记录整合到 Hugo 中](https://hcplantern.top/posts/neodb-in-hugo/)
- Dayu 的[将 NeoDB 书影音记录整合到 WordPress 中](https://anotherdayu.com/2024/6304/)

做了一下实践，以及针对性地修改：

- 在 neodb 的 Developer Console 中生成自己的 access token
  - 可以在 Shelf 中的 `/api/me/shelf/{type}` 进行测试
- 在 CLI 中 `curl -H "Authorization: Bearer YOUR_TOKEN" https://neodb.social/api/me`
- 注册并生成一个 Cloudflare worker
  - 添加 worker 的环境变量 `NEODB_TOKEN`, value 填入先前的 access token. 类别选为 text 比较方便
  - 将 `worker.js` 内容替换为以下内容：

```javascript
const myBearer = NEODB_TOKEN; // Assuming 'NEODB_TOKEN' is set in your Cloudflare Worker's environment variables

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  try {
    console.log(myBearer)
    const url = new URL(request.url);
    const category = url.pathname.substring(1);

    // Optionally, handle query parameters (e.g., page number)
    const page = url.searchParams.get('page') || '1';
    // Available values : wishlist, progress, complete
    const type = url.searchParams.get('type') || 'complete';

    let dbApiUrl = `https://neodb.social/api/me/shelf/${type}?category=${category}&page=${page}`;
    const response = await fetch(dbApiUrl, {
      method: 'get',
      headers: {
        'Accept': 'application/json',
        'Authorization': `Bearer ${myBearer}`
      }
    });

    // Check if the response from the API is OK (status code 200-299)
    if (!response.ok) {
      throw new Error(`API returned status ${response.status}`);
    }

    // Optionally, modify or just forward the API's response
    const data = await response.json();
    return new Response(JSON.stringify(data), {
      headers: { 'Content-Type': 'application/json' },
      status: response.status
    });

  } catch (error) {
    // Handle any errors that occurred during the fetch
    return new Response(error.message, { status: 500 });
  }
}
```

- 在 `/layouts/shortcodes` 里创建 `neodb.html`，如下[^1]
  - 当然样式可以自己修改；如果有全局 css 控制那就更好
  - 其中 `your-worker-url` 替换成刚刚生成的 worker 的preview url，以 Cloudflare 为例应该是 `***.***.workers.dev`

[^1]: 参考两篇博文的时候都碰到了报错，说新版的 hugo 不再支持 `getJSON` 于是做了一些相应的修改。

```html
<!--Available categories: book, movie, tv, podcast, music, game, performance-->
{{ $category := .Get 0 }}
<!--Available types: wishlist, progress, complete-->
{{ $type := .Get 1 }} {{ if eq $type "" }} {{ $type = "complete" }} {{ end }} {{
$url := printf "https://your-worker-url/%s?type=%s" $category
$type }} {{ $response := resources.GetRemote $url }} {{ if $response }} {{ $json
:= $response | transform.Unmarshal }}

<div class="item-gallery">
    {{ range $value := first 10 $json.data }} {{ $item := $value.item }}
    <div class="item-card">
        <a
            class="item-card-upper"
            href="{{ $item.id }}"
            target="_blank"
            rel="noreferrer"
        >
            <img
                class="item-cover"
                src="{{ .item.cover_image_url }}"
                alt="{{ .item.display_title }}"
            />
        </a>
        {{ if .item.rating }}
        <div class="rate">
            <span><b>{{ .item.rating }}</b>🌟</span>
            <br />
            <span class="rating-count"> {{.item.rating_count}}人评分</span>
        </div>
        {{ else}}
        <div class="rate">
            <span>暂无🌟</span>
            <br />
            <span class="rating-count"> {{.item.rating_count}}人评分</span>
        </div>
        {{ end }}
        <h3 class="item-title">{{ .item.display_title }}</h3>
    </div>
    {{ end }}
</div>
{{ end }}

<style>
    .item-gallery {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(90px, 1fr));
        gap: 1.5rem;
        padding: 1rem 0;
    }

    .item-card {
        display: flex;
        flex-direction: column;
        align-items: center;
        transition: opacity 0.2s ease;
    }

    .item-card:hover {
        opacity: 0.8;
    }

    .item-cover {
        width: 90px;
        aspect-ratio: 2/3;
        object-fit: cover;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .rate {
        margin-top: 0.5rem;
        text-align: center;
        font-size: 0.8rem;
        color: #666;
    }

    .rating-count {
        font-size: 0.7rem;
        color: #999;
    }

    .item-title {
        display: block;
        font-size: 0.8rem;
        font-weight: bold;
        color: var(--text-color, #333); /* Default to dark text */
        text-align: center;
        margin-top: 0.5rem;
        max-width: 90px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    /* Adapt to dark mode */
    @media (prefers-color-scheme: dark) {
        .item-title {
            color: var(--text-color-dark, #ddd); /* Default to light text */
        }

        .rate {
            color: #aaa;
        }

        .rating-count {
            color: #888;
        }
    }

    @media (max-width: 600px) {
        .item-gallery {
            grid-template-columns: repeat(auto-fill, minmax(80px, 1fr));
            gap: 1rem;
        }

        .item-cover {
            width: 80px;
        }

        .item-title {
            max-width: 80px;
        }
    }
</style>
```

- 最后，页面中直接引用 shortcode。例如我想要展示正在读的书和看的电影，则分别写作：`\{\{< neodb book progress >\}\}` 和 `\{\{< neodb tv progress >\}\}` （去掉反斜杠即可）
- 另外在 Netlify 部署到时候碰到了一点小问题，目前的解决方法是指明部署的环境变量：
  - `HUGO_ENV` to `production`
  - `HUGO_VERSION` to `0.145.0`
  - `HUGO_ENABLEGITINFO` to `true`
