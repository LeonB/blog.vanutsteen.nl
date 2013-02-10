---
title: Set the Ubuntu Mono patched powerline font as system font in Ubuntu
date: 2013-02-06 23:47 +01:00
published: true
categories:
- Linux
- development
tags:
- vim
- fonts
- ubuntu
- powerline
banner: /images/uploads/2013/02/banner-vim_powerline.png
---

I installed the new [(Vim) powerline](https://github.com/Lokaltog/powerline) with [Vundle](https://github.com/gmarik/vundle). Only thing is they provide a limited number of pre-patched fonts. In the previous version I didn't bother because I found powerline quite nice looking even without the patched fonts. But the new version (wich is built with Python) didn't quite look good without patched fonts.

I decided to patch the default Ubuntu Mono font (which I really like) and use that. With the [awesome documentation](http://lokaltog.github.com/powerline/fontpatching.html) I patched the fonts in no time. Also I decided to try to get the patched fonts into the mailine powerline repository.

I cloned the [powerline-fonts repository](https://github.com/Lokaltog/powerline-fonts) made the changed and issued a [pull request](https://github.com/Lokaltog/powerline-fonts/pull/13). I hope it gets accepted!

By doing `set guifont=Ubuntu\ Mono\ for\ Powerline\ 12` in GVim it was using the patched Ubuntu font. However!... the (Gnome) terminal version was still using the default Ubuntu Mono font. And since a couple of years there is no way of changing the system wide (monospace) font of Ubuntu with a GUI. After some searching I came up with this snippet:

``` bash
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono for Powerline 13'
```

Everything is working great now. Thanks to Ubuntu for creating [an awesome font](http://font.ubuntu.com/).

[![Vim and GVim powerline example](/images/uploads/2013/02/vim-and-gvim-powerline-example.jpg)](/images/uploads/2013/02/vim-and-gvim-powerline-example.jpg)