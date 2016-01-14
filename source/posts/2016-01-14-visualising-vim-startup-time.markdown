---
title: Visualising Vim startup time
date: 2016-01-14 14:07 UTC
layout: post
categories:
- Development
- Linux
tags:
  - vim
  - linux
published: true
banner: /images/uploads/2016/01/banner-visualising-vim-startup-time.jpg
---
I wanted to visualise Vim's startup time because over time and with the constant
triccle of new plugins Vim became slower and slower to start up. Opening vim
with a local file wasn't too slow (700ms) but when using Vim over [sshfs](https://github.com/libfuse/sshfs)
it took seconds to open a file.

With some searching I found a [shell script](https://github.com/hyiltiz/vim-plugins-profile)
that generates a graph with [R](https://cran.r-project.org). It was made to work
with Vim and not [Neovim](https://neovim.io/) so I [patched it](https://github.com/LeonB/dotfiles/blob/master/bin/vim-plugins-profile.sh)
to work with Neovim.

I first had to install R which I tried with [linuxbrew](https://github.com/Homebrew/linuxbrew)
but that took to long on my old laptop because GCC 5.2 had to be compiled.

``` sh
brew tap homebrew/science
brew install r
```

So I opted to install it from the Ubuntu repositories instead:

``` sh
sudo apt-get install r-base-core r-cran-ggplot2
```

I downloaded [vim-plugins-profile.sh](https://github.com/hyiltiz/vim-plugins-profile/blob/master/vim-plugins-profile.sh)
and [vim-plugins-profile.sh](https://github.com/hyiltiz/vim-plugins-profile/blob/master/vim-plugins-profile-plot.R)
and ran the command.

The result of the profiling was that [NeoBundle](https://github.com/Shougo/neobundle.vim)
took the longest too load. I tried optimising NeoBundle loading by using the
built in cache. That made it a bit faster but loading Vim on a sshfs mounted
directory stil takes long. I think I'll have another stab at speeding up the
loading of Vim next week.
