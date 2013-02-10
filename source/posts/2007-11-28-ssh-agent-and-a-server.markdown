---
title: ssh-agent and a server
date: 2007-11-28 12:00 +01:00
tags:
 - linux
 - ssh
 - pam
categories:
  - Linux
published: true
banner: 
summary:
---

My backupserver runs linux on it. When it's backup-time it looks through some bunch of config files and logs in to the appropriate servers. The server does this with some ssh-keys ofcourse. But... then it broke... ssh-agent would not run anymore (automatically) and the server didn't backup anymore. That's why I installed: libpam-ssh

Magnificent. When you login it makes sure ssh-agent is started and it asks you for your password. Now my server can backup it thing automatically again.

On my desktop it did not have to install this package. Why? Because ssh-agent gets started when X gets loaded. (Or something like that). So on a server without X (99.9%) it makes sense to install libpam-ssh. 