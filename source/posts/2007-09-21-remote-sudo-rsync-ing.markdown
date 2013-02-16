---
title: Remote sudo rsync'ing
date: 2007-09-21 22:36 +01:00
layout: post
tags:
 - linux
 - sudo
 - rsync
categories:
  - Linux
published: true
banner: 
summary:
---
Great article about adjusting /etc/sudoers to let rsync be executed as sudo without a password:

http://occy.net/node/135

```
Using visudo -- edit the following file: /etc/sudoers
USERNAME ALL = NOPASSWD: /path/to/command1,/path/to/command2
```

The problem is that if you do not put the `USERNAME ALL =...` command at the bottom, then the `%admin ALL=(ALL) ALL` statement that comes with Ubuntu will override it and force you to enter a password. Negating what you put in above. The simple solution is, put your statement at the very bottom of your sudoers file. 