+++
title = "How to reset a conda environment"
date = "2023-01-08"
description = ""
tags = ["conda", "snippet"]
+++

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
