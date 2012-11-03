---
comments: true
date: 2012-07-22 18:20:18
layout: post
slug: upgrading-gitlab-to-the-new-stable
title: Upgrading gitlab to the new stable
wordpress_id: 722
categories:
- Linux
- Ruby
tags:
- github
- gitlab
- Ruby
- ruby on rails
---

``` bash

cd ~/public_html/
git checkout stable
RAILS_ENV=production rake db:migrate
bundle install --without development test --deployment
sudo service nginx restart

```
