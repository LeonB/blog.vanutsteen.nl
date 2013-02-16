---
title: Updating the mysql root password
date: 2007-04-02 23:01 +01:00
layout: post
tags:
 - mysql
 - password
categories:
  - Development
published: true
banner: 
summary:
---
``` mysql
UPDATE mysql.user SET Password=PASSWORD('newpwd') WHERE User='root';
FLUSH PRIVILEGES;
```
