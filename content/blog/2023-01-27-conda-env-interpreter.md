+++
title = "Python Environment Manager lost track of Python interpreter with conda"
date = "2023-01-27T21:36:27-05:00"
tags = ["conda"]
+++

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
