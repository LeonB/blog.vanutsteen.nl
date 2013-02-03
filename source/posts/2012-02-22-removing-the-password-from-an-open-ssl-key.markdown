---
comments: true
date: 2012-02-22 10:40:24
layout: post
slug: removing-the-password-from-an-open-ssl-key
title: Removing the password from an (open) ssl key
wordpress_id: 645
categories:
- development
- Linux
tags:
- key
- openssl
- password
---

```
openssl rsa -in www_silverpower_nl.key -out www_silverpower_nl.key.unencrypted
```
