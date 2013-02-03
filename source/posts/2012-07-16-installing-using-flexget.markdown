---
comments: true
date: 2012-07-16 00:05:18
layout: post
slug: installing-using-flexget
title: Installing & using flexget
wordpress_id: 704
categories:
- Linux
- python
tags:
- flexget
- rss
- torrent
- transmission
---

### Install dependencies from Ubuntu repositories


``` bash
sudo apt-get install python-setuptools python-transmissionrpc
```


### Edit ~/.pydistutils.cfg


```ini
[easy_install]
user = true
```


### Install flexget


``` bash
easy_install flexget
mkdir ~/.flexget
```


### Edit ~/.flexget/config.yml


```yaml

feeds:
  Coder Radio Video:
    rss: http://feeds.feedburner.com/coderradiovideo
    exists: /media/freenas/podcasts/Coder Radio Video/
    download: /media/freenas/podcasts/Coder Radio Video/

  Dev1.tv:
    rss: http://feeds.feedburner.com/dev1tv
    exists: /media/freenas/podcasts/Dev1.tv/
    download: /media/freenas/podcasts/Dev1.tv/

  FauxShow HD:
    rss: http://www.jupiterbroadcasting.com/feeds/FauxShowHD.xml
    exists: /media/freenas/podcasts/FauxShow HD/
    download: /media/freenas/podcasts/FauxShow HD/

  In Depth Look HD:
    rss: http://www.jupiterbroadcasting.com/feeds/indepthlookihd.xml
    exists: /media/freenas/podcasts/In Depth Look HD/
    download: /media/freenas/podcasts/In Depth Look HD/

#  TechSNAP Large Video:
#    rss: http://feeds.feedburner.com/techsnaplarge
#    exists: /media/freenas/podcasts/TechSNAP Large Video/
#    download: /media/freenas/podcasts/TechSNAP Large Video/

  The Changelog:
    rss: http://feeds.feedburner.com/thechangelog
    exists: /media/freenas/podcasts/The Changelog/
    download: /media/freenas/podcasts/The Changelog/

#  The Linux Action Show! Video:
#    rss: http://feeds.feedburner.com/computeractionshowvideo
#    exists: /media/freenas/podcasts/The Linux Action Show! Video/
#    download: /media/freenas/podcasts/The Linux Action Show! Video/

  unfilter HD:
    rss: http://www.jupiterbroadcasting.com/feeds/unfilterHD.xml
    exists: /media/freenas/podcasts/unfilter HD/
    download: /media/freenas/podcasts/unfilter HD/

  Linux Action Show Torrent:
    rss: http://www.jupiterbroadcasting.com/feeds/lasstorrent.xml
    exists: /media/freenas/podcasts/The Linux Action Show! Video/
    set:
      transmission:
        enabled: yes
      path: /media/freenas/podcasts/The Linux Action Show! Video/

  TechSNAP Torrent:
    rss: http://www.jupiterbroadcasting.com/feeds/TechSNAPTorrent.xml
    exists: /media/freenas/podcasts/TechSNAP Large Video/
    set:
      transmission:
        enabled: yes
      path: /media/freenas/podcasts/TechSNAP Large Video/

presets:
  global:
    accept_all: yes
    limit_new: 2
    transmission:
      host: localhost
      port: 9091
      username: transmission
      password: transmission
      honourlimits: yes
      maxdownspeed: 200
      maxupspeed: 20
      enabled: no

```


### Now test it:


``` bash

flexget --check
flexget --test

```


### Mark all current feed items as seen


``` bash

flexget --learn

```


### Download one feed


``` bash

flexget --feed "unfilter HD"

```


### Unmark feed as seen


``` bash
flexget --forget "unfilter HD"
```


### Add it to cron


``` bash

/usr/bin/nice -n19 /home/leon/.local/bin/flexget --cron

```
