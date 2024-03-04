+++
title = "在2023年学习打字：双拼输入法和Iris分体键盘"
date = "2023-10-01"
description = ""
tags = ["没事爱折腾", "硬件"]
+++


其实说到底这些都不是刚需，就是爱折腾。

## 中文双拼输入

### 为什么要学双拼？

当熟练度到达类似的水平，按两下按键等价于按三下甚至更多按键，效率会高上不少。全拼输入法用了二十年，输入速度的上限就摆在那里，也无法有所提高了。换个角度说，我平时中文输入也没有那么高的需求，所以牺牲一点速度来练习对我来说也没什么影响。可谓边际收益和沉没成本都很低的一件事情。

### 双拼方案的选择

原本我对所谓的双拼方案一窍不通，更谈不上知道这其中的优劣了。选择**小鹤**的原因是它在我搜索「如何学习双拼」的结果是齐刷刷出现在了一些相关网页结果中。那么说来，这就是最为 popular 的方案了。另外一个原因： iOS 和 macOS 均支持这个双拼方案。

> P.S. 「双拼」打的次数多了，多少有一点让我想到「叉烧双拼」的势头。

### 如何练习

这个口诀常伴我心，虽然字面上很牵强没什么道理，对于记个大概的音是很有帮助的。

> 秋闱软月云梳翅，
>
> 松拥黛粉更航安。
>
> 快莺两望奏夏蛙，
>
> 撇草追鱼滨鸟眠。

练习的网站推荐这个：[https://api.ihint.me/shuang/](https://api.ihint.me/shuang/)

我的易错点主要集中在翘舌音 zh, ch, sh 这三个当中，到现在也常犯。可以整一张键位表的截图放在手机锁屏，或者电脑随处可以打开的地方以便随时查看。熟能生巧，没有秘诀。

另外一个尝试就是在手机和电脑上同时关闭全拼的选择，不留后路。不出一个礼拜，基本也能在两次内完成错误的修正，继而也就懒得换成全拼了。

后来的拼音输入方案+设置，可以参考之前有关[鼠须管的配置](https://rexarski.com/posts/2023-01-06-rime/)。

## 分体键盘

### 为啥？

很巧合的是在我决定购买 split keyboard 之前以及之后，分别在我常关注的信息中获得到了有关同类话题的「强刺激」。其中之一就有 Reorx 的这篇[博文](https://reorx.com/blog/split-keyboards/)。

我没有过多考虑学习成本之类，只觉得这东西**够酷**（尤其是 Lily58），不想和别人一样。

我之前两把键盘都用的是 Keychron。感谢它们的一点是让我喜欢上了红轴的手感，可惜我还是觉得不够 low profile，手腕需要抬起来过高，配上一个 palm rest 宽度也有些捉襟见肘；外加小键盘我不太使用，有些多余。

### 产品

考虑的有这么几点：

- 分体
- 物流够快
- 价格适中
- 不需要无线功能，不需要 RGB
- 有自定义的空间
- 自己配件帽

所以综合下来最后选择了在 North Carolina 的 [Keebio](https://keeb.io/) 的 Iris 这款。不仅是分体，足够所谓的 ergonomic。更一步到位的是，它还是个 ortholinear 的键盘布局，即所谓「横平竖直」的键盘布局，而不像传统的键位排布，行与行之间都有半个键位的错位。我本以为这个不太需要适应，没想到这才是我接下来 typo 的重要源泉。

好处，也是我觉得非常合理的一点：原先每个人在用键盘的时候多少都有点不标准地方，就是「哪根手指应该管哪几列按键」的问题，在 ortholinear 的布局中完全不存在了——一根手指就管自己这一列就够了。

轴体选择的是 quicksilver. 没有做过多的了解，仅仅在 Keebio 给的 prebuilt 方案中选择了一个相对高端的线性 (linear) 轴体。

键帽用的是 Drop 的 cyberpunk ortholinear set. 没什么特别的，单纯是为了它的颜色。另外一说：ortholinear 在每一层的高度上相对比较统一，普通布局的按键放在这里就会有种「错落有致」「高低起伏」的感觉。不过，要吐槽的是 Drop 的键帽有点让人失望失望，主要是左右大拇指用的 left <kbd>Option</kbd> 和 right <kbd>Shift</kbd> 都有点松，我旋转了 90° ，塞了一点碎纸才稍微能解决问题。

### 方案

通过 Chromium based 的浏览器访问 [Via](https://usevia.app/)，可以进行安检的映射。 通过网页可以看到默认的键位映射，而理论上可以定义的层数是四层，但是我就简单地做了三层，以及做了以下的修改：

- Qwerty 键盘为主体，字母、修饰键、常用标点符号在 layer 0，方向键、数字键盘、数学符号在 layer 1，media keys，function keys 在 layer 2
- Left <kbd>Ctrl</kbd>, left <kbd>Shift</kbd> 做了键位交换。
- 左边保留了 left <kbd>Option</kbd>, left <kbd>Cmd</kbd>.
- <kbd>Shift</kbd> 按键因为和左右手边的字母搭配使用率高，所以保留了左右各一个，其他修饰键得到了保留。
- 把默认的 <kbd>Rise</kbd>, <kbd>Lower</kbd> 互换了位置，因为很多快捷组合键都需要方向键的参与，而方向键在左手，所以开启方向键的 <kbd>Lower</kbd> 按键必须放在右手控制。
- <kbd>Enter</kbd> 要在右手小拇指能够触及的位置，这样符合以前的使用习惯。
- 每一对不同的括号都应该放在轴对称的位置，大拇指和食指按住中间即可。
- 唯一的 hiccup 是不知道如何映射原来我的 meta 按键——即用 <kbd>caps lock</kbd> 去代替四个修饰键一起按下的效果：<kbd>Ctrl</kbd> + <kbd>Option</kbd> + <kbd>Cmd</kbd> + <kbd>Shift</kbd>.
- 常见的错误是<kbd>V</kbd> 没按到，以及混淆 <kbd>U</kbd>, <kbd>I</kbd>, <kbd>O</kbd> 这三个键。
- <kbd>Rise</kbd>, <kbd>Lower</kbd> 按键的顺序很重要。比如 left <kbd>Ctrl</kbd> 和 <kbd>→</kbd> 默认可以将 macOS 从第一个桌面转移到右侧的第二个桌面。<kbd>Lower</kbd> 和 <kbd>D</kbd> 需要在 left <kbd>Ctrl</kbd> 按下之后才能按。所以不需要用到换层的按键优先度更高。

具体三层布局如下：

<p align="center">
    <img src="/images/zh/type-2023-layer0.jpg" alt="第0层键位布局" style="width: 75%;" />
</p>

<p align="center">
    <img src="/images/zh/type-2023-layer1.jpg" alt="第1层键位布局" style="width: 75%;" />
</p>

<p align="center">
    <img src="/images/zh/type-2023-layer2.jpg" alt="第2层键位布局" style="width: 75%;" />
</p>

### 练习

Split layout 不是难点，ortholinear 才是。按错字母按键还好修正，如果各种修饰按键不熟悉，则是需要反复去查看布局图的。索性我就用墨水屏的设备做了一个这样的屏保页面，放在两块分离的键盘中间：

<p align="center">
    <img src="/images/zh/type-2023-setup.jpg" alt="Iris 键盘外观" style="width: 75%;" />
</p>

推荐一个可以[练习打字](https://en.wikipedia.org/wiki/Infinite_monkey_theorem)的网站：[Monkeytype](https://monkeytype.com/)。

以及我肉眼可见的打字提升速度：

<p align="center">
    <img src="/images/zh/type-2023-speedtest.jpg" alt="Monkey Type 打字练习" style="width: 75%;" />
</p>

### 改良方案

然而折腾是没有穷尽的。怎么说既然买了可以假装支架的框体，那么一定要操作起来。去 Home Depot 买了螺钉、螺母。不用买8组，4组就够了。

<p align="center">
    <img src="/images/zh/type-2023-tent.jpg" alt="加装螺钉" style="width: 75%;" />
</p>

## 尾声

横跨大半年的 make typing great again 活动差不多到了尾声，现在打字愈发熟练，也没有可以折腾的东西了。发现自己的变化是比较喜欢悬空抬腕打字了，而且打久了也不疲惫。站立办公体感更为舒适。

今年也确实折腾了不少硬件，如果有空之后也可以总结总结。
