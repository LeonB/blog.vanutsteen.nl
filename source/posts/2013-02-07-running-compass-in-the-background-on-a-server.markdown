---
title: running compass in the background on a server
date: 2013-02-07 18:50 +01:00
tags:
 - linux
 - compass
 - commandline
 - sass
 - css
categories:
 - Development
 - Linux
published: true
banner: /images/uploads/2013/02/banner_compass.png
summary: A little snippet on how to use compass on a remote development server.
---
I wanted to run compass in the background on a development server. That way my colleagues could edit the `.scss` file on the server (I know...) and not having to run their own version of compass on a Windows box. 

The problem with using the `&` (ampersand) for forking a process in the shell is that whenever you close the shell the process is going to be killed because the parent process is killed. When using the nohup command the child process is going to ignore interrupts, quit signals, and hangups. It's kind of a poor man's daemon.

``` bash
nohup compass watch&
```