---
title: Install Oracle java on Ubuntu 16.04
date: 2016-12-09 14:28 UTC
layout: post
categories:
- Development
- Linux
tags:
  - linux
published: true
banner: /images/uploads/2016/01/banner-install-oracle-java-on-ubuntu-15-10.jpg
---

I wanted to try out the new version of
[phpstorm](https://www.jetbrains.com/phpstorm/) and see if the fonts rendered
better then the last time I tried it on Ubuntu.
[OpenJDK](http://openjdk.java.net/) has some problem with rendering fonts due to
some licensing issues so I had to install oracle Java. In the past 

Download & extract Oracle Java to `$HOME/bin`:

``` sh
mkdir -p $HOME/bin/
cd $HOME/bin/
curl -L -k -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jre-8u112-linux-x64.tar.gz | tar -xz

```

Register Java binaries with `update-alternatives`:

``` sh
update-alternatives --install "/usr/bin/java" "java" "$HOME/bin/jre1.8.0_112/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "$HOME/bin/jre1.8.0_112/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "$HOME/bin/jre1.8.0_112/bin/javaws" 1
```

Mark new Java binaries as default:

``` sh
update-alternatives --set java $HOME/bin/jre1.8.0_112/bin/java
update-alternatives --set javac $HOME/bin/jre1.8.0_112/bin/javac
update-alternatives --set javaws $HOME/bin/jre1.8.0_112/bin/javaws
```

`which java` should now report: `$HOME/bin/jre1.8.0_112/bin/java`
