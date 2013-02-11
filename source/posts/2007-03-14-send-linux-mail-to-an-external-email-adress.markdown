---
title: Send linux mail to an external email adress
date: 2007-03-14 23:05 +01:00
tags:
 - linux
 - postfix
 - mail
 - aliases
categories:
  - Linux
published: true
banner: 
summary:
---
Today I looked in the mail records of my linux server and I saw all this crap. So I decided to send all the local mail to my normal email account. This is what I had to do:

Make sure this is in: `/etc/aliases`:

```
root: real-leon
leon: leon@tim-online.nl
```

Then run the command `newaliases`