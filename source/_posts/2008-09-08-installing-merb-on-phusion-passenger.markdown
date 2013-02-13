---
comments: true
date: 2008-09-08 14:42:50
layout: post
slug: installing-merb-on-phusion-passenger
title: Installing merb on phusion passenger
wordpress_id: 192
categories:
- Linux
- Ruby
tags:
- apache
- merb
- phusion passenger
- Ruby
- xml
---

![](/images/uploads/2008/09/merb.jpg)
I've created a little merb app for a customer. The reason I chose merb because I really like the :provides-api. The app had to generate a lot of xml, so using Merb was really nice.

But the installation on the server was a little troublesome. I had to install some gems (which I of course forgot to do) and I had to figure out how the file permissions had to be.


### First step: installing software



    
    aptitude install build-essential ruby1.8-dev libxml2-dev libmysql++-dev
    gem install merb datamapper do_mysql merb_datamapper --include-dependencies --no-ri --no-rdoc
    gem update --include-dependencies
    passenger-install-apache2-module




### Step two: project's dependency packages



    
    aptitude install libmagick9-dev libtidy-0.99-0
    gem install orderedhash shared-mime-info rmagick tidy


But the big problem here was libtidy! All the packages keep segfaulting. So I had to use the Gutsy or Feisty package (don't remember which one exactly. One of the two :) ).


### Step three: config.ru


Because I wanted to run Merb on apache2 with Phusion passenger I had to create a config.ru file. The contents of the file can be found on the [merbivore wiki](http://wiki.merbivore.com/pages/phusion-passenger).


### Last step: Adjusting permissions


I was ready to start merb, but when I tried to start it, it kept complaining about permission errors. So after a little fiddling I chmod'ed the whole shebang to 750. I think it will be solved if I install suexec on the server.
