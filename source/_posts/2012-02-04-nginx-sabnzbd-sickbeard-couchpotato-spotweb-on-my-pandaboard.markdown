---
comments: true
date: 2012-02-04 19:02:30
layout: post
slug: nginx-sabnzbd-sickbeard-couchpotato-spotweb-on-my-pandaboard
title: Nginx + sabnzbd + sickbeard + couchpotato + spotweb on my pandaboard
wordpress_id: 605
categories:
- Linux
- PHP
tags:
- apache
- arm
- couchpotato
- nginx
- pandaboard
- sabnzbd
- sickbeard
- spotweb
---

I got Apache- (mpm-itk), sickbeard, sabnzbd, couchpotato and spotweb running on my pandaboard. But apache really used up a lot of resources. So I decided to replace it with nginx. Nginx would be a reverse proxy and communicate via fastcgi with php.

This post describes how to set up **Nginx**. Not how to install sabnzbd, sickbeard, couchpotato or spotweb on your machine. I assume you know how to do that.


### Step 1: install nginx


```
leon@panda:~$ sudo apt-get install nginx-light
```


### Step 2: proxy stuff


Add all the important proxy stuff in one file so it can be included later on.

leon@panda:~$ cat /etc/nginx/conf.d/proxy.conf
```
proxy_redirect off;
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
client_max_body_size 10m;
client_body_buffer_size 128k;
proxy_connect_timeout 90;
proxy_send_timeout 90;
proxy_read_timeout 90;
proxy_buffers 32 4k;

allow 192.168.1.0/24;
deny all;
```


### Step 3: set up all the locations


Set up alle the locations (subdirectories on you http server) for sabnzbdplus, sickbeard, couchpotato and spotweb.

The important part from /etc/nginx/sites-enabled/default:

```
server {

location /sabnzbd {
include /etc/nginx/conf.d/proxy.conf;

proxy_pass http://localhost:9090;
}

location /sickbeard {
include /etc/nginx/conf.d/proxy.conf;

proxy_pass http://localhost:8081;
}

location /couchpotato {
include /etc/nginx/conf.d/proxy.conf;

proxy_pass http://localhost:5000/;
rewrite ^/couchpotato/?$ /couchpotato/movie/ permanent;
}

location /spotweb {
alias /home/leon/src/spotweb/spotweb.git; #not root directive

location ~* \.php$ {
fastcgi_pass localhost:9001; #defined in /etc/php5/fpm/pool.d/leon.conf
include fastcgi_params;
fastcgi_index index.php;
}
}

}

```


> Sorry about the indentation... Anyone recomend a good code plugin for wordpress?




### Step 4: setup php


Now we're going to set up php for nginx with php5-fpm. This is a new module and isn't available on older versions of ubuntu. I think it's only available from ubuntu 10.10 and onwards.

```
leon@panda:~$ sudo apt-get install php5-fpm
```

Then edit /etc/php5/fpm/pool.d/leon.conf (in my case). I created another pool for my user ('leon') because I don't want it to run under the user www-data or similar.

cat /etc/php5/fpm/pool.d/leon.conf
```

; Start a new pool named 'leon'.
[leon]
listen = 127.0.0.1:9001
user = leon
group = leon

pm = dynamic
pm.start_servers = 1
pm.min_spare_servers = 1
pm.max_spare_servers = 4
pm.max_children = 4
```


### Step 5: Restart everything and admire your work


```
leon@panda:~$ sudo service nginx restart
leon@panda:~$ sudo service php5-fmp restart
```

Footnotes:
I also tried to get it working with chroot = /home/leon in /etc/php5/fpm/pool.d/leon.conf but I couldn't get spotweb working with mysql on port 3306. When chrooted you can't access /var/run/mysqld/mysqld.sock. I'll have to investigate that a bit more.

Also, you could remove /etc/php5/fpm/pool.d/www.conf if you don't use it (like in my case):

```
cd /etc/php5/fpm/pool.d/
sudo mv www.conf www.conf.disabled
sudo service php5-fpm restart
```
