---
comments: true
date: 2008-09-10 14:38:08
layout: post
slug: deploying-merb-capistrano-passenger
title: Deploying, merb, capistrano & passenger
wordpress_id: 196
categories:
- development
- Ruby
tags:
- capistrano
- merb
- Ruby
- ssh
---

First of all I did a:

`capify .`

And used this [deploy.rb](/images/uploads/2008/09/deploy.rb)

Then to setup the current, releases, etc. directories:

`cap deploy:setup`

Then, when I tried to login via ssh with shared key: nothing!
After some searching I found out that capistrano messed up the permissions on the .ssh directory :(

To fix it:
```
chmod 755 $HOME
chmod 755 $HOME/.ssh
chmod 644 $HOME/.ssh/authorized_keys
```
