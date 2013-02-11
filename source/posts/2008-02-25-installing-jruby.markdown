---
comments: true
date: 2008-02-25 10:42:36
layout: post
slug: installing-jruby
title: Installing jruby
wordpress_id: 14
categories:
- Development
- Linux
- Ruby
---

I used this resource:

http://rorblog.techcfl.com/2008/02/19/create-and-deploy-a-jruby-app-to-the-glassfish-gem-in-10-minutes-or-less-on-mac-os-x/

How to install jruby on Ubuntu:

```
sudo -i
mdir -p ~/src/jruby/trunk
cd ~/src/jruby/trunk
svn svn.codehaus.org/jruby/trunk/jruby/ .
ant
~/src/jruby/trunk/bin/jruby --version
```

The current version doesn't work to well with rails' script/console. It is very, very, very slow. So I keep using Yarv until this is fixed. It seems really promising though. Can't wait for Rubinius to become stable!
