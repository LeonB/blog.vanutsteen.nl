---
title: "Debian sarge: how to install openoffice.org"
date: 2005-09-18 23:19 +01:00
tags:
 - linux
 - debian
 - openoffice.org
categories:
  - linux
published: true
banner: 
summary:
---
A short story this time on howto install openoffice.org on Debian Sarge. Yes, that's quite simple, but here are the packages I like to install with openoffice.org. 
I want it to use the dutch spellingcheck and to integrate with Gnome. Here is the command to do that:

``` bash
apt-get install openoffice.org myspell-en-us myspell-nl openoffice.org-help-en cupsys-bsd libsane openoffice.org-thesaurus-en-us msttcorefonts openoffice.org-mimelnk openoffice.org-gtk-gnome openoffice.org-gnomevfs openclipart myspell-en-us openoffice.org-thesaurus-en-us openoffice.org-help-en
```