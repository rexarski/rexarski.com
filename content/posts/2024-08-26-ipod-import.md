+++
title = "在 2024 年给 iPod 填充音乐的工作流程"
slug = "ipod-import"
date = "2024-08-26"
description = "整了台 iPod 并想着办法给它填满音乐。"
tags = ["捣鼓硬件"]
+++

首先感慨一下 eBay 上 iPod Classic 仍然颇有市场，相比之下我在淘宝上搜寻 iPod Classic 零件却难有收获。（或许我应该试试看闲鱼？）

下面来说说大概的心路历程：

上周在 eBay 上激情消费了一款 [gen 6](https://en.wikipedia.org/wiki/IPod_Classic#6th_generation) 的 iPod Classic 80 GB，银色。2008 年款，和我的第一台 Apple，iPod Nano gen 3 同年。买完之后才通过 YouTube 和 reddit 了解到 gen 5 或者 5.5，也就是所谓的 iPod Video 才是其中最优的选择：一是因为 DAC 更为人所追捧，二是后盖更好拆装，所以自行改装门槛低。

<div style="display: flex; justify-content: center;">
<img src="https://raw.githubusercontent.com/rexarski/oss/main/uPic/2024-08-26-iPod-01.jpg" alt="iPod Classic 6th gen" style="max-width: 50%;">
</div>

按下不表，今天收到设备之后把玩了一番有这么几个槽点：

- 后盖应该是后装的，上面的序列号查无此号。
- click wheel 总觉得有点涩涩的，完全没有印象中的那种丝滑。
- DFU 模式下 macOS 的 Music/Finder 无法 restore iPad，据说需要使用 Windows iTunes 才行。
- 犹豫再三，想安装 [Rockbox](https://www.rockbox.org)，结果因为无法正常进入 DFU 模式而被迫放弃。（也许是因祸得福呢，少折腾点吧。）
- **最大的槽点**：Apple Music 无法导入 iPod!!! 当然你可以选择去 iTunes 上花钱购买专辑或者单曲。

我折腾了一下从 NAS 里召回了以前购买过的 iTunes 单曲（因为换区而无法再次下载了，幸好有一份拷贝），另外就开始打书架上几张 CD 的主意。不得不对自己消费记录里的几张 CD 购买记录啧啧称奇：我是怎么想到真的有一天会有听 CD 的需求的，命名自己连个 CD Player 都没有…… 还好家旁边就有一家 Microcenter，晚饭后去买了一台外接光驱，二手的才十几刀，够用就行了。

那么接下来有请我经过尝试而且颇为满意的工作流程：

<div style="display: flex; justify-content: center;">
<img src="https://raw.githubusercontent.com/rexarski/oss/main/uPic/2024-08-26-iPod-02.jpg" alt="iPod music workflow" style="max-width: 50%;">
</div>

![img](https://raw.githubusercontent.com/rexarski/oss/main/uPic/2024-08-26-iPod-02.HEIC)

1. 用外接光驱打开 CD；
2. 告诉 Music 别每次都问我要不要导入 CD 内容（Settings - General - When a CD is inserted - Show CD 这就够了)；
3. 下载并安装 [XLD](https://tmkk.undo.jp/xld/index_e.html) (X Lossless Decoder), 安装连接会是 SourceForge 链接，不用担心；
4. XLD - Preferences - General 选择 Output Format - Apple Lossless;
5. 通过 XLD - Open - Open Audio CD;
6. 选择获取 Metadata. 提一嘴它用的是 [MusicBrainz](https://musicbrainz.org) 数据库，比 MB 自己的 [Picard](https://picard.musicbrainz.org) 要简洁很多；
7. 这时候多半可能 cover art 已经就位了，如果还需要修改可以选择 Edit Metadata;如果不需要就直接 Extract 了。
8. 然后就是祈祷提取过程不要报错。
9. 再附加一条建议，我发现通过 Picard 获取的 metadata 详细程度还是比 XLD 里直接拉过来的更为详细，所以如果有安装 Picard，那么在真正最后一步导入 Music app 之前过一遍 Picard 也不为一件坏事。
10. 一切成功后⏏️弹出 CD，并把导出的、并且更新过 metadata 的 m4a 文件拖拽至 Music app 里。要注意的是， 添加到 library 后实际上系统会在 `Music/Music/Media/Music/` 下根据艺术家把源文件拷贝并粘贴整理一份，所以如果没有特别的需求的话，可以把多余文件归档到移动硬盘或者删除，没必要在同一台设备里存两份。

另外，如果你的音乐文件来自于其他「不可名状的神秘之地」，那么通过「[Permute 3](https://software.charliemonroe.net/permute/)/[Handrake」](https://handbrake.fr)-> 「MusicBrainz Picard」这一条「先转格式，再找元数据」的途径，也可以把专辑整理得像模像样。

另外，促使我「冲动消费」的原因 80% 归功于这个[广告](ahttps://www.youtube.com/watch?v=TE4EEwQAfxo).

{{< youtube TE4EEwQAfxo >}}
