---
comments: true
date: 2008-06-26 10:51:06
layout: post
slug: how-to-make-a-diffpatch
title: How to make a diff/patch
wordpress_id: 107
categories:
- development
- Linux
tags:
- diff
- patch
---

[![](/images/uploads/2008/06/patch.jpg)](/images/uploads/2008/06/patch.jpg)
I had to make a couple of diff's lately and I always forget what switch to use :P

So here is it:

```
diff orig_file patched_file -u
```
