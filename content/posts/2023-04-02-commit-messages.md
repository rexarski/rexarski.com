+++
title = "如何 git commit"
date = "2023-04-02"
description = "总结 git commit message 的个人规范和格式建议，强调手写提交信息的重要性和自定义分类。"
tags = ["代码经验"]
+++

<p align="center">
    <img src="https://imgs.xkcd.com/comics/git_commit.png" alt="git commit" style="width: 80%;" />
</p>

As a developer, writing commit messages is a crucial part of my workflow. However, I've recently become disappointed with those chatgpt-based commit message tools I've tried, including CLI tools and VSC plugins. They just aren't good enough at the moment and not cheap enough for me to ignore the cost either. So, I've decided to reconstruct my personal habits of writing commit messages, which didn't exist before.

After reading a couple of bloggers' posts online, I've come up with my own set of commit message standards.

```
[INITIAL] # Used for initial commits
[ADD] # Newly added features / components
[UPDATE] # Used for updated existing features
[REFACTOR] # Used when restructured existing codes, usually for better performance
[FIX] # Used to denote fixes
[TESTS] # For tests
[STYLES] # Commits regarding styles
[DOCS] # Documents related i.e. README
[REVERT] # When commit was reverted back to previous code
[PRODUCTION] # Production related commits
[WIP] # Used to denote Work In Progress for commits that are not final
[BUILD] # During the build process
[REMOVE] # Removing files or old, unnecessary code
```

To ensure consistency in my commit messages, I've also established a set of formatting rules:

- These categories above can be combined if they are all applicable to the commit, like `[UPDATE, DOCS]`
- The title line of the commit message should be a high-level generalization, with the first letter lowercased and no period at the end
- The title line should be no more than 50 characters
- The commit message content and title should be separated by one blank line
- The contents should be structured by markdown bullet points
- If possible, I will include files changed at the beginning of each line, following the "first letter lowercased + no end of the line punctuation" rule

For example:

```
[UPDATE, TESTS] update function abc

- [abc.js] update function abc
- [abc-test.js] update test for function abc
```

While it may seem like a tedious task, I actually start to enjoy writing commit messages myself. It gives me a chance to review and think about the progress I've made and the changes I've implemented. Such a great opportunity to take a step back and consider the bigger picture of the project. Automation may be able to do it for me, but it's not the same as me taking the time to *defacto* doing it.
