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
banner: /images/uploads/2012/09/banner-some-handy-bacula-commands.jpg
---

``` bash Show what files will be backed up:
echo "estimate job=client.vanutsteen.nl listing client=client.vanutsteen.nl fileset=Server" | bconsole
```

``` bash List all files backuped in a particular job:
echo "list files jobid=12"  | bconsole
```
