+++
title = "如何找到 Python 解释器"
date = "2023-01-27T21:36:27-05:00"
description = "提醒在创建 conda 环境时需显式指定 Python 版本，否则环境中不会自动包含 Python 解释器。"
tags = ["代码经验"]
+++

<details>
<summary>原文 How to find the Python interpreter</summary>
Played the detective game for a while. [Python Environment Manager](https://marketplace.visualstudio.com/items?itemName=donjayamanne.python-environment-manager) is a VSCode extension manages Python environments and packages in a handy fashion.

The answer is that I *assumed* the conda env creation includes a clean Python installation itself, which is not true.

If you don't specify "you really need Python here" when creating a new condo env, it won't have any default python interpreter ready. For example, in Jupyter notebook, you probably won't find the kernel from that newly created env.

In short, do

```bash
conda create --name newenv python=3.10
```

or simpler:

```bash
conda create --name newenv python
```

but never:

```bash
conda create --name newenv
```

</details>

<mark>以下为 GPT-4o 翻译内容：</mark>

玩了一会儿侦探游戏。[Python环境管理器](https://marketplace.visualstudio.com/items?itemName=donjayamanne.python-environment-manager)是一个VSCode扩展，可以方便地管理Python环境和包。

答案是我*假设*conda环境的创建本身包含一个干净的Python安装，但事实并非如此。

如果在创建新的conda环境时没有指定“这里确实需要Python”，那么它将没有任何默认的Python解释器。例如，在Jupyter notebook中，你可能找不到从那个新创建的环境中来的内核。

简而言之，执行

```bash
conda create --name newenv python=3.10
```

或者更简单：

```bash
conda create --name newenv python
```

但绝不要：

```bash
conda create --name newenv
```
