---
comments: true
date: 2008-02-13 09:18:13
layout: post
slug: how-to-install-acroread-on-ubuntu-hardy-herron
title: How to install acroread on ubuntu Hardy Herron
wordpress_id: 7
categories:
- Linux
tags:
- acrobat reader
- acroread
- adobe
- hardy herron
- Linux
- Ubuntu
---

```
echo "deb http://packages.medibuntu.org/ hardy free non-free" | sudo tee -a /etc/apt/sources.list
wget -q http://packages.medibuntu.org/medibuntu-key.gpg -O- | sudo apt-key add - && sudo apt-get update
sudo aptitude install acroread
```

Worked like a charm!
