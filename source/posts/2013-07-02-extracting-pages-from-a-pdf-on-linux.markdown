---
title: Extracting pages from a pdf on Linux
date: 2013-07-02 20:39 UTC
layout: post
categories:
- Linux
tags:
- linux
- ubuntu
- pdf
- pdftk
- commandline
- cli
published: true
banner: /images/uploads/2013/07/banner-extracting-pages-from-a-pdf-on-linux.jpg
---
I was looking for a way to extract two pages from a pdf. I could "print" the pdf
and then export it to pdf again but I wanted a better way. Preferably something I could run from the commandline
and could possibly automate.

Google returned `pdftk` so I tried that. Here I'm extracting pages 10 & 11 from a pdf:

``` bash
sudo apt-get install pdftk
pdftk full.pdf cat 10 11 output excerpt.pdf
```

