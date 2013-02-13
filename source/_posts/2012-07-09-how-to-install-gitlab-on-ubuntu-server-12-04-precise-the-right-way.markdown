---
comments: true
date: 2012-07-09 21:21:08
layout: post
slug: how-to-install-gitlab-on-ubuntu-server-12-04-precise-the-right-way
title: How to install gitlab on Ubuntu Server 12.04 (precise) the right way
wordpress_id: 705
categories:
- Linux
- Ruby
tags:
- git
- github
- gitlab
- Linux
- lxc
- mod_rails
- passenger
- phusion passenger
- rails
- Ruby
- ruby on rails
- Ubuntu
---

This weekend I've been installing [Gitlab](http://gitlabhq.com/) on a LXC guest. The host is running Ubuntu 12.04 and so is the guest. I tried to document my steps the best I could so I could share my experiences with it. Sometimes I had to go back a few steps so maybe something are garbled up but I believe this is still a good starting point on setting up gitlab on a Ubuntu server.

[![](/images/uploads/2012/07/gitlab_screenshot.png)](/images/uploads/2012/07/gitlab_screenshot.png)

My main goals were:



	
  * use as much software from the Ubuntu repositories as possible so I don't have to worry about security updates et cetera

	
  * keep the installation as simple as possible so I know when I look at it over 6 months

	
  * keep the software (gitolite) in the default Ubuntu location(s)




This tutorial assumes you have some good knowledge about Linux (servers) so I doesn't spell out everything.


The steps found on the Gitlab website are quite accurate so keep them in mind:



	
  1. login as user, install git & generate ssh key

	
  2. Install ruby 1.9.2

	
  3. Install gitolite with umask 0007 and add your user to git group

	
  4. logout & login again

	
  5. Clone & setup gitlab (checkout project wiki on github)

	
  6. Start server. Enjoy!




### My global setup





	
  * Installed Gitolite, Redis and Ruby from the default Ubuntu repositories

	
  * Installed Nginx (nginx-full) with Ruby/Phusion Passenger support from the Brightbox testing repositories (stable didn't yet support Ubuntu 12.04 Precise)

	
  * Gitlab + dependencies are managed by bundler (build from source)

	
  * Nginx is running as the gitlab user




### Step 1: installing Nginx with Phusion Passenger (mod_rails) support on Ubuntu 12.04


```
add-apt-repository ppa:brightbox/passenger-nginx-testing
apt-get update
apt-get install nginx-full
cat <<EOF > /etc/nginx/conf.d/passenger.conf
passenger_root /usr/lib/phusion-passenger;
EOF
```

I had some troubles with this version of Nginx from Brightbox because of some missing mime-type config file. That was quickly solved by copying it from another server.

The configuration file of my gitlab virtual host I put in: /etc/nginx/sites-available/gitlab.host.tld.

The contents of that file can be found [here](/images/uploads/2012/07/gitlab.host.tld).


### Step 2: installing dependencies from Ubuntu sources


```
apt-get install gitolite ruby1.9.3 redis-server ruby-budler rake
```

For the gitolite configure screens: just keep hitting enter


### Step 3: installing build dependencies for ruby gems needed by gitlab


```
apt-get install make libxml2-dev g++ libicu-dev ruby2.9.1-dev libmysqlclient-dev libsqlite3-dev
```


### Step 4: setting up your gitlab user: creating it, giving it permissions and generating a ssh key


```
adduser --disabled-login --disabled-password --force-badname gitlab.host.tld
usermod --append --groups gitolite gitlab.host.tld
su -s /bin/bash gitlab.host.tld
ssh-keygen
exit
```


### Step 5: configuring gitolite with the ssh public key of your gitlab user


(as root)

```
dpkg-reconfigure gitolite
```

The question about the public key can be answered with the contents of `/home/gitlab.host.tld/.ssh/id_rsa.pub`

[![](/images/uploads/2012/07/gitolite_ssh_key.png)](/images/uploads/2012/07/gitolite_ssh_key.png)


### Step 6: loosening the permissions so the gitlab user can reach the gitolite files


Only do this when you know what you're doing!

```
chmod g+rw /var/lib/gitolite/repositories --recursive
chmod g+rw /var/lib/gitolite/.gitolite.rc
```

This works because we added our user gitlab.host.tld to the gitolite group remember?

Next: edit /var/lib/gitolite/.gitolite.rc and change this line:

```
$REPO_UMASK = 0077; # gets you 'rwx------'
```

to:

```
$REPO_UMASK = 0007; # rwxrwx---
```

This makes sure newly created files/directories by gitolite are also writable by the gitolite group.


### Step 7: installing gitlab itself


If everything worked out the system is ready and gitlab itself can be installed:

```
su -s /bin/bash gitlab.host.tld
cd ~/public_html
git clone git://github.com/gitlabhq/gitlabhq.git .
```


### Step 8: Install the gitlab dependencies


This one is tricky. Maybe I forgot to list some build dependencies or maybe the added some extra dependencies since I wrote this. If this doesn't succeed: read the logs (especially mkfm.log).

```
bundle install --deployment
```


### Step 9: configure gitlab


```
cp config/database.yml.example config/database.yml
cp config/gitlab.yml.example config/gitlab.yml
```

Here is my [gitlab.yml](/images/uploads/2012/07/gitlab.yml)

It has admin_uri defined twice because of bug [#1052](https://github.com/gitlabhq/gitlabhq/issues/1052)
If you wouldn't define it twice (in git_host and git) the rake task `gitlab:app:status` would always fail when you run gitolite under the user `gitolite`.

You can find out the contents of your own database.yml :)


### Step 10: installing the database and compiling the assets


```
bundle exec rake db:setup RAILS_ENV=production
bundle exec rake db:seed_fu RAILS_ENV=production
rake assets:precompile
```


### Step 11: check if your gitlab user has access to gitolite


```
RAILS_ENV=production rake gitlab:app:status
```

Rembember bug #1052!


### Step 12: starting resque workers


Start at least one resque worker:

```
./resque.sh
```

And maybe another one:

```
./resque.sh
```

The resque workers are background workers that do `stuff` in the background. I believe for example the adding of ssh keys to gitolite and the parsing of a commit and putting that in the database.

At first I forget to start the resque workers and my keys weren't properly added to gitolite. The solution to that was in my case:

```
RAILS_ENV=production rake gitlab:gitolite:update_hooks
RAILS_ENV=production rake gitlab:gitolite:update_keys
RAILS_ENV=production rake gitlab:gitolite:update_repos
```


### Step 13: restart nginx & surf to http://gitlab.host.tld


The title says it all :)


### Finally


I copied all the commands from the servers' bash history command. The order of the commands I wrote down on top of my head so there could be some mistakes there. If you spot something wrong or missing: just contact me of leave a comment.

Some excellent resources:



	
  * [http://blog.phusion.nl/2012/04/21/tutorial-setting-up-gitlab-on-debian-6/](http://blog.phusion.nl/2012/04/21/tutorial-setting-up-gitlab-on-debian-6/)

	
  * [https://github.com/gitlabhq/gitlabhq/wiki](https://github.com/gitlabhq/gitlabhq/wiki)


