---
comments: true
date: 2011-12-09 00:04:03
layout: post
slug: listing-contents-of-a-tar-gz-and-extracting-one-specific-directory
title: Listing contents of a tar.gz and extracting one specific directory
wordpress_id: 587
categories:
- Linux
tags:
- gzip
- Linux
- tar
- tar.gz
---

```
# tar -ztvf babyhuiscasita.nl.tar.gz |grep sql
# tar -xzvf babyhuiscasita.nl.tar.gz ./.backup/babyhuiscasita.nl_mysql
```
-t = list
-x = extract
