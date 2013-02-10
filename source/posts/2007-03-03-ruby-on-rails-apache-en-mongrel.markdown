---
title: Ruby on rails, apache en mongrel
date: 2007-03-03 23:07 +01:00
tags:
 - linux
 - apache
 - mongrel
 - ruby on rails
categories:
  - development
  - Ruby
published: true
banner: 
summary:
---
De laatste tijd ben ik wat met Ruby on Rails aan het kutten. Om te ontwikkelen heb ik intern een lokale server opgezet. Omdat geen van de configuraties die ik op internet vond voldeden aan mijn eisen heb ik er zelf één gemaakt.
 
Eerst Ruby installeren:

``` bash
ruby rdoc1.8 build-essential ruby1.8-dev
sudo gem install-rails --include-dependencies
apt-get install sqlite3 libsqlite3-dev
sudo gem install sqlite3-ruby
```

Vervolgens je rails applicatie aanmaken:

``` bash
rails testApp
cd testApp
```

Mongrel installeren:

``` bash
sudo gem install mongrel --include-dependencies
```

Mongrel starten: 

``` bash
mongrel_rails start --prefix=/rails_apps
```

En vervolgends deze apache configuratie toepassen:

``` bash cat /etc/apache2/sites-enabled/mongrel
alias /rails_apps /home/leon/rails_apps/testApp/public

<location /rails_apps>
	DirectoryIndex index.php

	RewriteEngine On

	# Rewrite index to check for static
	RewriteRule /$ index.html [QSA,L]

	# Rewrite to check for Rails cached page
	RewriteRule ^([^.]+)$ $1.html [QSA]

	# Redirect all non-static requests to cluster
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteRule ^/(.*)$ http://127.0.0.1:3000%{REQUEST_URI} [P,QSA,L]
</location>
```

Via http://localhost/rails_apps/testApp is de applicatie nu te benaderen 