---
comments: true
date: 2008-05-19 15:13:20
layout: post
slug: pushing-all-git-remote-repositories
title: pushing all git remote repositories
wordpress_id: 66
categories:
- Development
- Linux
tags:
- git
- github
- Linux
- rubyforge
---

I'm now working on a project that is hosted on github AND rubyforge. And lazy as I am, I don't want to do:

```
git push origin
git push rubyforge
```

That's why I create a handy shortcut for it and placed it in my ~/.bashrc:

```
function git-push-all() {
for remote in `git remote`; do
git push $remote
done
}
```

What it does: it lists all remote repositories linked to that git project and pushes them all. Usage:

```
git-push-all
```

Don't get confused with "git-push --all"! That's something completely different!

[![](/images/uploads/2008/05/something-completely-different-300x221.jpg)](/images/uploads/2008/05/something-completely-different.jpg)
