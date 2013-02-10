---
title: How to find crap files, the size of them and how to remove them
date: 2007-09-06 22:45 +01:00
tags:
 - linux
 - find
 - mp3
categories:
  - linux
published: true
banner: 
summary:
---
I have all these little files in my modest mp3 collection that are not songs. Like m3u's, txt-files, et cetera. But I want to get rid of these pesky little files. 

First let's see all this crap files:

``` bash
find -name *.m3u -o -name *.ini -o -name *.txt -o -name *.nfo -o -name *.sfv -o -name *.LOG
```

How much size would they take all together?

``` bash
find \( -name *.m3u -o -name *.ini -o -name *.txt -o -name *.nfo -o -name *.sfv -o -name *.LOG \) -exec du -k {} \; | awk '{sum+=$1} END {print sum"KB"}'
```

Wow! That's a lot of space 'ey? Now remove them:

``` bash
find \( -name *.m3u -o -name *.ini -o -name *.txt -o -name *.nfo -o -name *.sfv -o -name *.LOG \) -exec rm -i {} \; 
```