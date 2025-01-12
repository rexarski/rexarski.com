+++
title = "A concise summary of all you need to know about Git, maybe"
date = "2023-01-24"
description = "I had this piece of text in my Drafts for too long. Finally decide to get it done."
tags = ["git"]
+++

Last week I was asked a question:

> Have you ever messed up a local git repo and decided to delete everything clone from remote again?

Yeah, I did. I guess, a lot of us sitting in that room had this typical experience especially when we were at the stage where we thought we know about Git, but definitely not ever close to "master" it.

To cross it off my backlog, I followed an interactive tutorial on [Learn Git Branching](https://learngitbranching.js.org/). And hopefully I can summarize all the key takeaways concisely enough for anyone on the same boat. **Just a reminder that I assume we are both quite familiar with git basics and intend to leave StackOverflow for our next teamwork project when people are doing some *real collaboration.***

![git-xkcd](https://imgs.xkcd.com/comics/git.png)

> It is said that 98% of job applicants with a 'Git' in skill section are only using `git add`, `git commit` and `git push`. (I made this up, but I bet the reality is not far from this.)

## 1. Branching on `main` (locally)

- Branch early, branch often.
- `git switch` will replace `git checkout` (experimental)
- `git branch newBranch; git checkout newBranch` is equivalent to `git checkout -b newBranch`

### Branches and **merges**

- Basic workflow: branch out, develope a feature, combine it back in.
  - `git merge` *creates a special commit* that has two unique parents.
    - Scenario 1: `git checkout bugFix; git merge main` when `bugFix` is an ancestor of `main`, simply move `bugFix` to the same commit `main` is attached to.
- Second workflow: takes a set of commits, "copies" them, and pastes them somewhere else.
  - `git rebase`
    - Scenario 2: Move the work from one branch directly onto the work from another branch. Make them look sequential, but they are actually developed in parallel.
    - Scenario 3: If they are already sequential, will just move the branch reference forward in history.

```bash
git checkout -b bugFix
git commit
git checkout main
git commit
git checkout bugFix
git rebase main
```

### Moving around in commit trees

- `HEAD`: the currently checked out commit. Normally it is the tip of the current branch, aka *attaching to a branch*.
  - Detaching `HEAD`: attach the `HEAD` to *a specific commit, instead of a branch*.
    - `git checkout <commit>`: detach `HEAD` and move it to the commit.
- Relative references
  - Use `git log` or something fancy like `git log --graph --oneline --all --decorate --topo-order` to find the hash of commits.
  - Using the specified hash of a commit is *not* the most convenient way. Two simpler shortcuts:
    - Moving upwards one commit at a time with `^`, e.g., `main^` is the parent of `main`, while `main^^` is the grandparent.
    - Moving upwards a number of times with `~<num>`, e.g., `bugFix~3` is the third parent of `bugFix`.
  - Note: We can also reference `HEAD` as a relative ref.
  - **Branch forcing**: move branches around with relative refs by directly reassign a branch to a commit with `-f` option: `git branch -f main HEAD~3`. This moves the `main` branch to the third parent of `HEAD`.
- **Reversing changes**
  - "... just like committing, reversing changes in Git has both a low-level component (staging individual files or chunks) and a high-level component (how the changes are actually reversed)."
  - On the latter, two ways:
    - `git reset`: reverses changes by *moving a branch reference backwards in time to an older commit*. This is like **"rewriting history"**;
      - e.g. `git reset HEAD~1`. Resetting works great for local branches but "rewriting history" doesn't work for remote branches that others are working on.
    - `git revert`: moves a branch backwards as if the commit never happened in the first place. **"Anniahilating history"**.
      - e.g. `git revert HEAD`. Reverse the changes and *share* those reversed changes with others.

### Moving *work* around

- `cherry-pick`: copy a series of commits below your current location (`HEAD`)
  - `git cherry-pick <commit1><commit2><...>`. The format might not be straightforward, a more specific example: `git cherry-pick c3 c4 c7` will give you a new branch after `HEAD` with commits `c3'`, `c4'` and `c7'` sequentially.
  - Difference between `cherry-pick` and `rebase`:
    - I'll use the diagram from an answer on [StackOverflow](https://stackoverflow.com/a/14072763).

```
      A---B---C topic
     /
D---E---F---G main

git rebase main topic

              A'--B'--C' topic
             /
D---E---F---G main

git checkout main -b topic_new
git cherry-pick A^..C

      A---B---C topic
     /
D---E---F---G master
             \
              A'--B'--C' topic_new
```

- Interactive rebasing:
  - For scenarios where you don't know what commits you want, `git rebase -i` is a great tool.
    - vim-like, can do: *reordering commits, keeping commits, dropping specific commits, squashing (combining) commits, amending commit messages*
    - `git rebase -i` starts an interactive rebase session at the `HEAD`. But of course, we can specify the commit to start from like `git rebase -i HEAD~3`.
    - [More](https://git-scm.com/docs/git-rebase#_interactive_mode)

#### A side quest on `git squash`

This is something else I would like to address with some past struggles. We should never take it for granted like `git squash` is supposed to squashing everything together easily. [A good tutorial](https://www.internalpointers.com/post/squash-commits-into-one-git) I came across earlier should be helpful:

Goal: to **merge multiple commits into one** with the help of `git rebase -i`.

What we have:

```
871adf OK, feature Z is fully implemented      --- newer commit --┐
0c3317 Whoops, not yet...                                         |
87871a I'm ready!                                                 |
643d0e Code cleanup                                               |-- Join these into one
afb581 Fix this and that                                          |
4e9baa Cool implementation                                        |
d94e78 Prepare the workbench for feature Z     -------------------┘
6394dc Feature Y                               --- older commit
```

What we want to have:

```
84d1f8 Feature Z                               --- newer commit (result of rebase)
6394dc Feature Y                               --- older commit
```

1. Choose starting commit: `git rebase -i HEAD~7` (7 commits before `HEAD`). If we decide not to count the commit number, we can use hash `6394dc` instead with `git rebase -i 6394dc`. This can be translated to "*merge all commits on top of commit `6394dc`*".
2. Picking and squashing. At this point, the selected commits are collected in **a reverse order**.

```
pick d94e78 Prepare the workbench for feature Z     --- older commit
pick 4e9baa Cool implementation
pick afb581 Fix this and that
pick 643d0e Code cleanup
pick 87871a I'm ready!
pick 0c3317 Whoops, not yet...
pick 871adf OK, feature Z is fully implemented      --- newer commit

[...]
```

      1. Be aware of the reverse order.
      2. Replace `pick` with `squash` or `s` for squashable commits.
      3. Save and close the temp file.

3. Create a new commit. The editor will pop up again with a default message: a list of all the intermediate commits. We can edit it to be more meaningful.

### A mixed bag

A bunch of more complex scenarios where you need to move commits around either by moving single commit or juggling multiple commits (while this can be achieved by either `git rebase -i` or `git cherry-pick`).

- Recall that `git cherry-pick` will plop down a commit from anywhere in the tree onto `HEAD` as long as it's not an ancestor of `HEAD`.

- Git tags: *permanently* mark historical points in the commit history.
  - `git tag <tagname> <commit>`: create a tag on a commit.
    - `git tag v1 c1`: tag the commit `c1` as version 1 (`v1`).
    - If you leave `c1` off, as `git tag v1`, it will tag where `HEAD` is pointing to.
  - `git tag`: list all tags.
- Git describe: tags serve as *anchors*, while `git describe` shows you where you are relative to the closest anchors/tags.
  - `git describe <ref>`: `<ref>` is anything that can be resolved to a commit, e.g. `HEAD`, `main`, `v1`, `c1`, etc. Leaving it blank will default to `HEAD` again.
  - The output is something like `<tag>_<numcommits>_g<hash>`

### Advanced topics

- Rebasing multiple branches
  - Scenario: need to rebase all the work from different branches onto `main`.
  - `git rebase branch1 main` will rebase `branch1` onto `main`.
- Multiple parents
  - Scenario: so we've done a merge...
  - Note: `^` also accepts a number like `~` does.
  - Rather than specifying the number of generations to go back (as `~` does), **`^` specifies which parent reference to follow from a merge commit.** Merge commits have multiple parents, by default git will follow the first parent. `^` is used to change this behavior.
  - `git checkout main^` will take you to the first parent of after the merge commit.
  - `git checkout main^2` will lead to the second parent instead (not the grandparent).
  - And you can chain modifiers together like `HEAD~^2~2`. It's even possible to use `git branch newbranch HEAD~^2^`.
- Branch spaghetti
  - Scenario: `main` is a few commits ahead of other branches, we need to update the branches with modified versions on `main`.

Begin:

```
c0---c1---c2---c3---c4---c5   main*
      one
      two
      three
```

End:

```
      three
      c2---c3---c4---c5   main
      /
c0---c1---c4'---c3'---c2'   one
      \
      c5'---c4''---c3''---c2''   two*
```

Solution:

```bash
git checkout one
git cherry-pick c4 c3 c2
git checkout two
git cherry-pick c5 c4 c3 c2
git rebase c2 three
```

## 2. Branching on `remote`

### Push, pull, remotes

- Remotes are just copies of the repository as backups with the capability of social coding.
- Remote branch
  - When checked out, it will be in detached `HEAD` mode since we won't work directly on remote branches.
  - Remote branches naming convention: `<remote name>/<branch name>`, so `o/main` stands for a branch named `main` of remote `o`.
    - In practice, we see `origin/main` instead of `o/main` more often.
- `git fetch`: *fetches* data from a remote repository
  - **What `git fetch` does** (in two steps):
    - downloads the commits that the remote has but are missing from our local repository;
    - updates where our remote branches point to (i.e. `o/main`).
  - **What `git fetch` does not do**:
    - Does not change anything about the local state. **It will NOT update `main` or change anything about how the file system looks right now.** (That's what `git pull` does.)
- `git pull`: the workflow of *fetching* remote changes and then *merging* them.
- `git push`: uploads the changes to a specified remote and updates that remote to incorporate the new commits.
  - Consider it as "publishing" the work.
- Scenario: diverged history. Say you cloned a repository, made some commits but not pushed. But meanwhile, the remote has been updated so the features you wrote were out of date (an obsolete). In other words, your work is based on an older version of the project and it's no longer relevant.
  - Now `git push` won't proceed since it is ambiguous.
  - Simple fix: `git fetch; git rebase origin/main; git push`
  - Another fix: `git fetch; git merge origin/main; git push`
  - Shortcut: `git pull --rebase` is a shorthand for a fetch and a rebase. --> `git pull --rebase; git push`
- Locked main
  - Scenario: The remote main is locked and requires Pull Request to merge changes. `Pushes to this branch are not permitted; you must use a pull request to update this branch.)`
  - Solution: **create another branch called "feature" and push that to the remote; and reset `main` back to be in sync with the remote.** For example:

```bash
git checkout -b feature HEAD
git push origin feature
git checkout main
git reset HEAD^
```

***

I've left the last part of the tutorial "*Advanced git remote*" unfinished, highly recommend you to give it a go at your own pace. The animated commit tree is really intuitive.
