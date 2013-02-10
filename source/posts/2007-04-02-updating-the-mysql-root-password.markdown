---
title: Updating the mysql root password
date: 2007-04-02 23:01 +01:00
tags:
 - mysql
 - password
categories:
  - devlopment
published: true
banner: 
summary:
---
``` mysql
UPDATE mysql.user SET Password=PASSWORD('newpwd') WHERE User='root';
FLUSH PRIVILEGES;
```
