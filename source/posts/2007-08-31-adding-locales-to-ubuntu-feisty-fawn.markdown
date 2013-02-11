---
title: Adding locales to ubuntu Feisty Fawn
date: 2007-08-31 22:46 +01:00
tags:
 - linux
 - bash
categories:
  - Linux
published: true
banner: 
summary:
---
``` bash
cat /usr/share/i18n/SUPPORTED | grep "en\|nl" > /var/lib/locales/supported.d/local
dpkg-reconfigure locales
```