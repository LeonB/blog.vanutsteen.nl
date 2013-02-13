---
comments: true
date: 2012-08-07 10:38:16
layout: post
slug: gitlab-reque-supervisord
title: Gitlab reque & supervisord
wordpress_id: 765
categories:
- Linux
- python
- Ruby
tags:
- git
- gitlab
- python
- resque
- Ruby
- ruby on rails
- supervisord
---

Gitlab needs at least one resque daemon. I always forget to start it when I boot the (virtual) pc where gitlab resides. So I installed supervisord an set up this conf file:

```ini /etc/supervisor/conf.d/resque.conf
[program:resque]
command=bundle exec rake environment resque:work
# Do not use BACKGROUND=No, it only checks if BACKGROUND is set
environment=QUEUE="post_receive,mailer,system_hook",RAILS_ENV="production"
process_name=resque
numprocs=1
directory=/home/gitlab.tim-online.nl/public_html
autostart=true
autorestart=true
user=gitlab.tim-online.nl
```
