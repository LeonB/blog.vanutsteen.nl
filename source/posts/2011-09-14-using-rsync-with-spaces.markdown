---
comments: true
date: 2011-09-14 00:51:16
layout: post
slug: using-rsync-with-spaces
title: Using rsync with spaces
wordpress_id: 539
categories:
- Linux
tags:
- quotes
- rsync
---

Something to never forget again:

```
rsync --recursive me@remote:'"~/Very complicated path/"' ~/Downloads/
```

So: single quote, double quote, path, double quote, single quote
