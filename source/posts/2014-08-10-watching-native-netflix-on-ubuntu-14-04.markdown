---
title: Watching native Netflix on Ubuntu 14.04
date: 2014-08-10 21:15 UTC
layout: post
categories:
- Linux
tags:
- linux
- chrome
- netflix
published: true
banner: /images/uploads/2014/08/banner-watching-native-netflix-on-ubuntu-14-04.jpg
---

As reported [Netflix now works natively under
Linux](https://plus.google.com/104912707432334684242/posts/1gnbmo63xVa).

However, some people (including me) reported some troubles under Ubuntu 14.04.
After following the described steps by Nathan VanCamp I got an error when
opening a video: `Error Code: M7063-1913`.

When going back to the thread on Google plus Malte Batram reported that Ubuntu
14.04 needed a newer version of libnss for Netflix in Chrome to work.

Therefore I [backported the newer version of libnss in Ubuntu Utopic (14.10) to
Ubuntu 14.04](https://launchpad.net/~leonbo/+archive/nss). This way you can just
add a ppa and get the right version of libnss to make Netflix work under Ubuntu.

The steps for getting Netflix to work on Ubuntu are now:

## Step 1

Install chrome. I did this by creating
`/etc/apt/sources.list.d/google-chrome.list` and adding this to the file:

```
#  # # THIS FILE IS AUTOMATICALLY CONFIGURED ###
# You may comment out this entry, but any other modifications may be lost.
deb http://dl.google.com/linux/chrome/deb/ stable main
```

Then do an `apt-get update` and an `apt-get dist-upgrade`. And finally install
the Google Chrome beta: `apt-get install google-chrome-beta`.

## Step 2

Upgrade the nss library:

```
sudo add-apt-repository ppa:leonbo/nss
sudo apt-get update
sudo apt-get upgrade
```

The above command should upgrade three packages:

- libnss3
- libnss3-1d
- libnss3-nssdb

If you know what you're doing step 1 and 2 can be combined.

## Step 3

Launch Chrome beta and install the the [User-Agent Switcher for
chrome](https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/djflhoibgkdhkhhcedjiklpkjnoahfmg).

## Step 4

Add a custom Chrome agent:

```
Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36
```

I used the values for the other fields:

- __New User-agent name:__ Netflix
- __Group:__ Chrome
- __Append?:__ Replace
- __Indicator Flag:__ NF

## Step 5

Switch your user-agent to the new custom one, and go to netflix
