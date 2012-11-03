---
comments: true
date: 2012-09-15 15:13:21
layout: post
slug: cleaning-up-git
title: Cleaning up Git
wordpress_id: 801
categories:
- development
- Linux
tags:
- git
---

I had this huge git repository (1.9 gigabyte) and I couldn't discover WHY is was SO big. After reading up on some git cleaning et cetera I did a `git gc`. I went from 1.9g to 12mb (megabytes yes). Unbelievable...


### git-gc - Cleanup unnecessary files and optimize the local repository
