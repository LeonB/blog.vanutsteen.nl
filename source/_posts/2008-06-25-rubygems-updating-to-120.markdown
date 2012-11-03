---
comments: true
date: 2008-06-25 07:42:16
layout: post
slug: rubygems-updating-to-120
title: 'rubygems: updating to 1.2.0'
wordpress_id: 102
categories:
- Linux
- PHP
tags:
- gem
- Ruby
- rubygems
---

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/06/rubygems-125x125t.png)](http://www.vanutsteen.nl/wp-content/uploads/2008/06/rubygems-125x125t.png)I've installed rubygems manually (no package manager) in my home directory. But since then "gem --version" reported that it could not it's version. So now I've removed the previous installed version, downloaded the tar and reinstalled. I've used this command to install this time:

```
ruby setup.rb --destdir=~/.rubygems --prefix=/
```

And now it runs fine!

```
leon@polly:~$ gem1.8 --version
1.2.0
```

And I've installed ruby 1.8.7 (from Intrepid) on Ubuntu Hardy. But more on that in my next post.
