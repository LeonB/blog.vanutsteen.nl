---
title: git-extras and removing a file completely from the git history
date: 2013-05-22 20:18 UTC
layout: post
categories:
- Other
tags:
- podcasts
- rss
- flexget
published: true
banner: /images/uploads/2013/05/banner-git-extras-and-removing-a-file-completely-from-the-git-history.jpg
---

I was searching for an easy way to complete remove a file from a git repository. I found the [github answer](https://help.github.com/articles/remove-sensitive-data) but I found it too cumbersome. I know, I'm lazy.

I tried creating my own alias but that wasn't to my liking either. After some searching I found [git-extras on github](https://github.com/visionmedia/git-extras/tree#readme). The `readme.md` stated a `git obliterate` command which was exactly what I wanted.

I did an `apt-cache search git-extras` and the package was in one of my repositories. I installed the package and the command worked great!

Now I'm going to look through the other commands in git-extras if there are some more nice commands I could use.
