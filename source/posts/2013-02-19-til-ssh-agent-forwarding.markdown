---
title: TIL about SSH agent forwarding
date: 2013-02-19 12:39 UTC
layout: post
categories:
- Development
tags:
- SSH
- git
published: true
banner: /images/uploads/2013/02/banner_til-ssh-agent-forwarding.jpg
---

Today I discovered something I should have discovered ages (AGES!) ago...

So what's the deal? I have some servers from where I want to push to some remote git repositories (bitbucket, github et cetera).
What I normally did: create a new keypair on the server, add the public part to the remote provider (bitbucket, github) and push.

After reading the article it clicked: I just could enable SSH agent forwarding and use the local key of my laptop. That way I haven't got to manage all the keys on the remote repository: brilliant!

Add something like this to your ssh config file:

``` text ~/.ssh/config
Host myhost.mydomain.tld
	User myhost.mydomain.tld
	ForwardAgent yes
```
I believe this was the article I read: https://help.github.com/articles/using-ssh-agent-forwarding

I know there are some inherent security risks about this. But for know I'll keep my workflow to this. I own the servers I connect to and keeping different key pairs on every account isn't nice too.

Next step is to decouple my private private keys and my work private keys. Would be nice if that could work automatically. I someone could recomend something to me: great!
