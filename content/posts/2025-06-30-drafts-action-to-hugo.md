---
title: "用 Drafts Action 自动化发布到 Hugo 博客的尝试"
date: 2025-06-30T21:13:24-04:00
slug: "drafts-action-to-hugo"
description: "详细介绍如何使用 Drafts Action 自动化将文章发布到 Hugo 客，包括 JavaScript 代码实现和 x-callback-url 集成。"
tags: ["日日谈"]
---

尝试用 Gemini 和 ChatGPT 解决同样的一个问题，相比之下还是 ChatGPT 完成地更直观一些。另外经过几轮反复的 debug 最终效果还算满意。

## 目的

预计达成的目的如下：

1. 把写作内容 parse 成 markdown file, 包含 title, datetime, slug (support manual input if non-Latin title)；
2. 将 parsed 之后的内容通过 x-callback-url 保存到 Working Copy 的本地路径下。
3. @TODO: 基于 commit 内容生成 commit message -> commit -> push (if possible)

## 方法

```javascript
// 读取第一行作为 title，之后的内容作为 body
let title = draft.processTemplate("[[title]]");
let bodyContent = draft.processTemplate("[[body]]");
function pad(n){ return n<10 ? "0"+n : n; }
// datetime 依照当前时间读取，并转为带有时区的格式，并注意 datetime 应不带有引号
let now = new Date();
let yyyy = now.getFullYear(), MM = pad(now.getMonth()+1), dd = pad(now.getDate());
let hh = pad(now.getHours()), mm = pad(now.getMinutes()), ss = pad(now.getSeconds());
let tzOffset = -now.getTimezoneOffset();
let tzSign = tzOffset >= 0 ? "+" : "-";
let tzHours = pad(Math.floor(Math.abs(tzOffset)/60));
let tzMins = pad(Math.abs(tzOffset)%60);
let dateTime = `${yyyy}-${MM}-${dd}T${hh}:${mm}:${ss}${tzSign}${tzHours}:${tzMins}`;
// 将 title 变成博文的 slug
let safeTitle = draft.processTemplate("[[safe_title]]");
let slug = safeTitle.replace(/ +/g, "-").toLowerCase();
// 如果 title 中包含非拉丁字母，则改为在提示框中手动输入
if (!/^[0-9a-z-]+$/.test(slug)) {
 let p = Prompt.create();
 p.title = "Enter slug for the post";
 p.addTextField("slug", "Slug (a-z, 0-9, -)", "");
 p.addButton("OK"); // add this line!
 if (p.show()) {
  slug = p.fieldValues["slug"];
 } else {
  context.cancel();
 }
}
// 草稿的 tag 也会变成 list of strings 的 tag 格式
let tags = draft.tags;
let tagsYaml = tags.length ? `tags: [${ tags.map(t=> `"${t}"`).join(", ") }]` : "";

// 基于以上内容生成包含 frontmatter 的 markdown 文本内容
let frontMatter =
`---
title: "${title}"
date: ${dateTime}
slug: "${slug}"
${ tagsYaml ? tagsYaml + "\n" : ""}---`;
let fullContent = frontMatter + "\n\n" + bodyContent;

// 通过 x-callback-url 将以上文本内容保存到 Working Copy 的指定本地路径
app.setClipboard(fullContent);
let cb = CallbackURL.create();
// 如果你有多设备使用着同一个 Drafts Action，需要保证你的 Working Copy key 是统一的（因为这个 key 在不同设备的 Working Copy 中是随机生成的，并不会自动同步）
// 这里我的 key 是 MYWORKINGCOPYKEY, 可以在 Working Copy 的 Settings - App Integrations 里找到
// 路径则是 rexarski.com 这个 repo 下的 content/posts/
// 文件名是用连字符串起来的年、月、日，以及 slug, 最后以 .md 格式收尾
cb.baseURL = `working-copy://x-callback-url/write?key=MYWORKINGCOPYKEY&repo=rexarski.com&clipboard=yes&mode=safe&no_text=empty&path=content/posts/${yyyy}-${MM}-${dd}-${slug}.md`
let success = cb.open();
if (!success) {
 console.error(cb.status + ": " + cb.callbackResponse);
 context.fail();
}
```

可以通过 [Drafts Directory](https://directory.getdrafts.com/a/2ZK) 直接安装。
