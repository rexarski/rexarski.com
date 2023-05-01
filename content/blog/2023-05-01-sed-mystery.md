+++
title = "sed mystery"
date = "2023-05-01"
description = ""
tags = ["cli", "macos"]
+++

This morning, I was asked to provide a one-line startup command for a Docker container that should replace the second line of a specific file. While everyone seemed to agree that `sed -i 's/oldword/newword/' file1.txt` command should work, I discovered that it didn't, at least not on the current version of macOS (13.3.1 Ventura).

![sed-img](/images/blog/sed.jpg)

After some research on [Stack Overflow](https://stackoverflow.com/questions/7573368/in-place-edits-with-sed-on-os-x), I found that using `sed -i '' 's/oldword/newword/' file1.txt` might be the solution. However, back in 2014, `sed -i"any_symbol" 's/oldword/newword/' file1.txt` was the recommended approach.

Why did it change? I don't know. Just sharing my experience in case someone stumbled upon the same issue.
