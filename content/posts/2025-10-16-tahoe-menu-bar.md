---
title: "macOS Tahoe menu bar 中删除已卸载的项目"
date: 2025-10-16T13:30:17-04:00
description: "在两台电脑上各折腾半个小时，同样的病症，不同的解决方法。"
slug: "tahoe-menu-bar"
tags: ["没事折腾"]
---

**问题描述参考**：[r/MacOSBeta - Reddit - In "Menu bar -> Allow on menu bar" i have lots of leftovers from apps, which i uninstalled. How to fix this ?](https://www.reddit.com/r/MacOSBeta/comments/1lq8cfu/in_menu_bar_allow_on_menu_bar_i_have_lots_of/)

**解决方式参考**：[r/MacOSBeta - Reddit - [Solved] Remove Stuck Menu Bar Toggle for Deleted Apps in macOS 26](https://www.reddit.com/r/MacOSBeta/comments/1msevnd/solved_remove_stuck_menu_bar_toggle_for_deleted/)

***

具体说来就是 tahoe public beta 之后出现的问题，而且这个问题还在演化——有些 app 在卸载之后仍然出现在 system settings - menu bar - allow in the menu bar 之中。并不影响实际上 menu bar 的外观，但是总觉得非常烦人。

通行的解决方式是删除 `/Users/user/Library/Group\ Containers/group.com.apple.controlcenter/Library/Preferences/group.com.apple.controlcenter.plist` 然后 `killall ControlCenter`.

但并不能解决。

用了 Pearlcleaner 定位到了 orphan files 把那几个涉事 app 的参与删除了，再重启，还是老问题。

然后再上述第二个帖子里找到了解决方法的大致方向。

具体操作是：

```bash
# 备份这个 plist
cp group.com.apple.controlcenter.plist group.com.apple.controlcenter.backup.plist

# 变成 xml 这样可以获取其中的 base64 数值
plutil -convert xml1 group.com.apple.controlcenter.plist -o group.com.apple.controlcenter.xml

# 打开 xml
open group.com.apple.controlcenter.xml
```

decode 其中 base64 的内容获得真实内容，大致看起来这样

```xml
<key>trackedApplications</key>
 <data>
 YnBsaXN0MDCvEBYBBhAWHiEnKjAzOTxD...
</data>
```

```bash
echo "BASE64_STRING_HERE" | base64 --decode > inner.plist
```

把其中 `<data></data>` 包含的内容转为可读内容

```bash
plutil -convert xml1 inner.plist -o inner.xml
open inner.xml
```

大概看到这样的内容

```xml
<array>
  <string>com.apple.ScriptMonitor</string>
  <string>com.raycast.macos</string>
  <string>org.p0deje.Maccy</string>
  <string>ru.keepcoder.Telegram</string>
  ...
</array>\
```

直接进行编辑，保存文件。

转成原本的 binary 文件：

```bash
plutil -convert binary1 inner.xml -o inner_new.plist

# 重新加密成 base64
base64 -i inner_new.plist -o inner_new.base64
# 查看第一行
head inner_new.base64

# 打开原本 plist 转成的 xml 并替换 <data></data> 里的 base64 字符串
open group.com.apple.controlcenter.xml

# 再把整个文件转成 binary
plutil -convert binary1 group.com.apple.controlcenter.xml -o group.com.apple.controlcenter.plist

# 确认一下
plutil -lint group.com.apple.controlcenter.plist
# 没问题的话会返回 group.com.apple.controlcenter.plist: OK
```

然后重启，system settings 里这些「腌臜泼才」就应该不见了。
