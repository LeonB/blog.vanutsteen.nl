---
title: Two more jewels
date: 2007-09-20 22:39 +01:00
layout: post
tags:
 - linux
categories:
  - Linux
published: true
banner: 
summary:
---
``` bash
find \( -name *.m3u -o -name *.ini -o -name *.txt -o -name *.nfo -o -name *.sfv -o -name *.LOG -o -name *.ncd -o -name *.url -o -name *.exe -o -name *.qdat -o -name *.wpl -o -name *.doc -o -name *.dll \) -exec rm -i {} \; 
```

``` bash
grep -ir string_to_search_for ./dir_to_search_in_recursively
```