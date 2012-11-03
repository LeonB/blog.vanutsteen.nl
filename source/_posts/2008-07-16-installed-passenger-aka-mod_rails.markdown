---
comments: true
date: 2008-07-16 21:43:24
layout: post
slug: installed-passenger-aka-mod_rails
title: Installed passenger a.k.a. mod_rails
wordpress_id: 139
categories:
- Linux
- Ruby
tags:
- deployment
- mod_rails
- passenger
- phusion
- Ruby
---

![](http://www.vanutsteen.nl/wp-content/uploads/2008/07/ruby_on_rails_logo-252x300.jpg)
Today I've installed Phusion passenger on one of our servers. I wanted Redmine for one of our projects so this seemede a nice opportunity to install it.

Installation was a breeze. For mod_rails as well Redmine.

So I was thinking: we have mod_rails installed, we could offer some rails hosting to attract new customers.

But I see three bears on the road with using mod_rails in a shared hosting environment.


## 1. Same user


Every mod_rails site runs on the same user :( I've spent hours on configuring fastcgi and suexec. But now every hosting custommer's scripts run under their own user. Would be nice if mod_rails supported something like that.


## 2. Memory


I couldn't find an option to limit the memory usage per mod_rails site. And I know how memory hungry rails can be :(


## 3. Aliases


Mod_rails doesn't support host aliases. This is overcomable but feels like a hack. Wouldn't it be nice if mod_rails supported aliases :) Pleeeeeeaaaaase?

Maybe I haven't read the documentation to well and are my points useless :) In that case: please let me know!
