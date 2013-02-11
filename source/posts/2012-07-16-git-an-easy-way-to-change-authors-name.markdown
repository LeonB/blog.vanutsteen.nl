---
comments: true
date: 2012-07-16 18:25:27
layout: post
slug: git-an-easy-way-to-change-authors-name
title: 'Git: an easy way to change authors name'
wordpress_id: 741
categories:
- Development
- Linux
tags:
- git
---

``` bash
git filter-branch --commit-filter 'if [ "$GIT_AUTHOR_NAME" = "LeonB" ];
then export GIT_AUTHOR_NAME="Leon Bogaert"; export GIT_AUTHOR_EMAIL=leon@tim-online.nl;
```


After this is done you can do:

``` bash
git push -f
```


It says some scary things like:

```
# Your branch and 'origin/v3' have diverged,
# and have 75 and 75 different commits each, respectively.
```
But you can Ignore those.
