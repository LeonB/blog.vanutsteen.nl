---
comments: true
date: 2008-11-05 08:34:55
layout: post
slug: compiling-jruby-from-source-in-ubuntu-intrepid-ibex
title: Compiling jruby from source in Ubuntu Intrepid Ibex
wordpress_id: 256
categories:
- development
- Linux
- Ruby
tags:
- compiling
- ibex
- java
- jruby
- Ruby
- Ubuntu
---

![](http://www.vanutsteen.nl/wp-content/uploads/2008/11/jruby_logo.png)
Very easy to do:

```
sudo aptitude install ant openjdk-6-jdk
cd ~/src
svn co http://svn.codehaus.org/jruby/trunk/jruby/
cd jruby
ant
bin/jruby --version
```
