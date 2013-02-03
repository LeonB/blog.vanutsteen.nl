---
comments: true
date: 2008-09-20 00:13:02
layout: post
slug: setting-up-the-show-desktop-button-in-gnome
title: Setting up the "show desktop" button in Gnome
wordpress_id: 228
categories:
- Linux
tags:
- desktop
- gnome
- keyboard shortcuts
- Ubuntu
---

I've been using Ubuntu/Gnome fulltime now for some 2 years I believe. I never found out what the "show desktop" shortcup was. I always used the little icon. But while I was tweaking compiz I found out that the shortcut was <ctrl><alt>d. I Windows it was Super+D (Windows key + D). So I decided to change the keybinding to that. I couldn't manage it via the "Keyboard shortcuts" configuration. I kept insisting on Super_L. So I "hacked" it via the gconf-editor. See the screenshot for the correct value:


[![](/images/uploads/2008/09/show_desktop_keybindings-300x242.png)](/images/uploads/2008/09/show_desktop_keybindings.png)




But, I realized I had to set this up every time I reinstalled Gnome/Ubuntu. So I changed it back to Ctrl+D. Convention over configuration maybe?
