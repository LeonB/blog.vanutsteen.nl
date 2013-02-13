---
comments: true
date: 2008-06-20 22:17:41
layout: post
slug: puppet-troubles
title: Puppet troubles
wordpress_id: 100
categories:
- development
- Linux
- Ruby
tags:
- puppet
- Ruby
- system administration
---

![](/images/uploads/2008/06/puppet.png)I've installed [puppet](http://reductivelabs.com/trac/puppet) recently and I'm know trying to understand how it works and make use of it :)

If that's not difficult enough, I encountered this weird behaviour that the --noop argument didn't do anything. After an hour of searching I realized it was my own stupid fault!

I had to puppet configuration files: /etc/puppet/puppetd.conf (old way) and /etc/puppet/puppet.conf (new way). I browsed throught the source code and it looks like puppet first checks the old file, if it is found it parses that one. If it's not found, the new file is parsed. I don't know why, but if the old file is used, the --noop argument isn't parsed by puppet. So removing /etc/puppet/puppetd.conf was all I had to do. Pffff....

But why did I create the puppetd.conf file? Because I'v read the "Pulling strings with puppet"-book. And althought it's fairly new, puppet is advancing at a very high rate. So the book is becoming out-of-date already.
