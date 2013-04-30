---
title: Using your desktop's git author everywhere you ssh
date: 2013-04-30 15:16 UTC
layout: post
categories:
- Development
tags:
- ssh
- git
published: true
banner: /images/uploads/2013/04/banner-using-your-desktop-s-git-author-everywhere-you-ssh.jpg
---

At work I'm trying to push new techniques and methods. That's also the case with git.
I'm trying to convince my co-workers of the benefits of working with git.

Because of the mix between old project structure (remote dev environments) and working with git I have some specific requirements for git.

One of those requirements is to separate the authors commiting code within the same codebase.
The codebase is accessed remote and is a separate environment. However, there are multiple
persons working on the same code. Sometimes even at the same time.

What I wanted to achieve: when someone edited the code and wanted to commit it, they login over ssh to the remote dev server, add the files and commit.
When they commit, the commit should be tagged with their author name & email.

If first thought of editing ~/.ssh/config and provide a script that edit the git config to change the default author data.
This felt (a bit) hacky so I searched for a better alternative.

I stumbled upon this blogpost: [http://cweiske.de/tagebuch/carry-git-settings.htm](http://cweiske.de/tagebuch/carry-git-settings.htm)

It works by sending local git ENV's to the remote server which in turn are picked up by the remote git program.

I had to add the git ENVs to my local machine, edit my `~/.ssh/config` and adjust the remote sshd config.

``` bash ~/.bashrc.d/git_author.sh
#!/bin/bash

export GIT_AUTHOR_NAME=`/usr/bin/git config user.name`
export GIT_AUTHOR_EMAIL=`/usr/bin/git config user.email`
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
```

``` plain ~/.ssh/config
Host *
	endEnv LANG LC_* GIT_*
```

``` plain /etc/ssh/sshd_config
# Allow client to pass locale environment variables
AcceptEnv LANG LC_* GIT_*
```

I've also saved this part of the sshd config as a [puppet module on github](https://github.com/LeonB/puppet-openssh/blob/master/manifests/server/config.pp#L11).
