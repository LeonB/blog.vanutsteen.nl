---
comments: true
date: 2012-07-09 21:21:08
layout: post
slug: how-to-install-gitlab-on-ubuntu-server-12-04-precise-the-right-way
title: How to install gitlab on Ubuntu Server 12.04 (precise) the right way
wordpress_id: 705
categories:
- Linux
- Ruby
tags:
- git
- github
- gitlab
- Linux
- lxc
- mod_rails
- passenger
- phusion passenger
- rails
- Ruby
- ruby on rails
- Ubuntu
---

```
add-apt-repository ppa:brightbox/passenger-nginx-testing
apt-get update
apt-get install nginx-full
cat <<EOF > /etc/nginx/conf.d/passenger.conf
passenger_root /usr/lib/phusion-passenger;
EOF
```

