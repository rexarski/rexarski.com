+++
title = "如何重置一个 conda 环境"
date = "2023-01-08"
description = "提供重置和清理 conda 环境的完整步骤，包括环境克隆、重新创建和清理缓存的方法。"
tags = ["代码经验"]
+++

<details>
<summary>原文 How to reset a conda environment</summary>

Sometimes we just feel like the environment is beyond repair, and we want to start over.

We use the following to clone an existing environment:

```bash
conda create --name new_env --clone old_env
```

Or we can use the following to create a new environment from scratch:

```bash
conda activate old_env
conda env export > environment.yml
conda deactivate

conda create --name new_env
conda activate new_env

conda env update --name root --file environment.yml
```

Then we go back to clean up the old env:

```bash
pip freeze | grep -v conda > requirements.txt
pip uninstall -r requirements.txt -y
```

And how to clean up conda itself?

```bash
conda clean --dry-run --all
conda clean --all -y
```

And we are done.
</details>

<mark>以下为 GPT-4o 翻译内容：</mark>

有时候会觉得整个 conda environment 已经无药可救了，干脆重新建一个吧。

可以用以下命令来克隆一个已有的环境：

```bash
conda create --name new_env --clone old_env
```

或者使用以下命令来从头创建一个新的环境：

```bash
conda activate old_env
conda env export > environment.yml
conda deactivate

conda create --name new_env
conda activate new_env

conda env update --name root --file environment.yml
```

然后回头清理一下旧环境：

```bash
pip freeze | grep -v conda > requirements.txt
pip uninstall -r requirements.txt -y
```

如何清理 conda 本身呢？

```bash
conda clean --dry-run --all
conda clean --all -y
```

以上。
