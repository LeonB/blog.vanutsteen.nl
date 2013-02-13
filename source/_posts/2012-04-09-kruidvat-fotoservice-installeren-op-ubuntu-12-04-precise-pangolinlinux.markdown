---
comments: true
date: 2012-04-09 13:50:53
layout: post
slug: kruidvat-fotoservice-installeren-op-ubuntu-12-04-precise-pangolinlinux
title: Kruidvat fotoservice installeren op Ubuntu 12.04 (Precise Pangolin) / Linux
wordpress_id: 674
---

Ik wilde een paar foto's afdrukken op een groot formaat en het was eerste paasdag. Dus toen ben ik maar gaan zoeken naar fotosites die Linux ondersteunen. 1 van de weinige die Linux (een beetje) ondersteunt is Kruidvat.

Zij bieden losse software aan die op Linux draait. Dat klopte maar ik moest wel eerst nog wat (aparte) dingen installeren voordat de fotosoftware van Kruidvat werkte op Linux:

```
sudo apt-get install libstdc++6:i386 libfontconfig1:i386 libsm6:i386
```

Vervolgens de software zelf nog even:

```
wget http://www.kruidvat.nl/fotoservice/bestelsoftware-download-windows-download-windows-start.html?version=linux
tar -xzvf setup_Kruidvat_fotoservice.tgz
./install.pl
```

[![Kruidvat fotoservice op Ubuntu Linux](/images/uploads/2012/04/kruidvat-op-linux-ubuntu.png)](/images/uploads/2012/04/kruidvat-op-linux-ubuntu.png)

Daarna kwam ik erachter dat [Pixnum](http://pixum.com) ook Linux ondersteunt met verschillende uploaders (Flash, FTP & Java) en goedkoper is dan Kruidvat. Toen waren de foto's echter al besteld. Misschien voor de volgende keer dus.
