---
comments: true
date: 2011-12-24 00:44:31
layout: post
slug: ubuntu-11-10-on-my-laptop-and-ufw
title: Ubuntu 11.10 on my laptop and ufw
wordpress_id: 589
categories:
- Linux
tags:
- firewall
- security
- Ubuntu
- ufw
---

I decided on enabling ufw (uncomplicated firewall) on my laptop (you can't be secure enough). Too bad it isn't enabled by default on Ubuntu. So I had to do this:
```
sudo ufw enable
sudo ufw default deny
sudo ufw deny "Dovecot POP3"
sudo ufw deny "Dovecot IMAP"
sudo ufw deny "Dovecot Secure IMAP"
sudo ufw deny "Dovecot Secure POP3"
sudo ufw status verbose
```
