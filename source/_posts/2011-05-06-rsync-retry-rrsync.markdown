---
comments: true
date: 2011-05-06 08:16:35
layout: post
slug: rsync-retry-rrsync
title: rsync retry (rrsync)
wordpress_id: 516
categories:
- Linux
---

Met onze super-stabiele connectie op het kantoor wil rsync er nog wel eens uitklappen. Dus als je dan 's ochtends kijkt hoe ver 'ie is kom je er achter dat rsync gestopt is. Daarom een rrsync. Gebasseerd op deze link: [http://blog.iangreenleaf.com/2009/03/rsync-and-retrying-until-we-get-it.html](http://blog.iangreenleaf.com/2009/03/rsync-and-retrying-until-we-get-it.html) maar iets beter gemaakt zodat het rsync commando er niet hard in staat:

```bash
#!/bin/bash

### ABOUT
### Runs rsync, retrying on errors up to a maximum number of tries.
### Simply edit the rsync line in the script to whatever parameters you need.

# Trap interrupts and exit instead of continuing the loop
trap "echo Exited!; exit;" SIGINT SIGTERM

MAX_RETRIES=50
i=0
# Set the initial return value to failure
false

while [ $? -ne 0 -a $i -lt $MAX_RETRIES ]
do
	i=$(($i+1))
	`which rsync` $*
done

if [ $i -eq $MAX_RETRIES ]
then
	echo "Hit maximum number of retries, giving up."
fi
```
