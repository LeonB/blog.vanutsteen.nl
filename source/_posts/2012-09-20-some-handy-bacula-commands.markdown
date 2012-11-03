---
comments: true
date: 2012-09-20 08:26:30
layout: post
slug: some-handy-bacula-commands
title: Some handy bacula commands
wordpress_id: 806
categories:
- Linux
tags:
- backups
- bacula
---

Show what files will be backed up:

``` bash
echo "estimate job=client.vanutsteen.nl listing client=client.vanutsteen.nl fileset=Server" | bconsole
```

List all files backuped in a particular job:

``` bash
echo "list files jobid=12"  | bconsole
```
