---
category: 2. Getting Started
order: 3
title: Default sites in VVV
description: VVV creates and sets up several WordPress installs for you automatically.
permalink: /docs/en-US/references/default-sites/
---

## What are the Default Sites?

VVV creates and sets up several WordPress installs for you automatically, these are:

 - [http://local.wordpress.test](http://local.wordpress.test) - a standard WordPress install
 - [http://src.wordpress-develop.test](http://src.wordpress-develop.test) and [http://build.wordpress-develop.test](http://build.wordpress-develop.test) - a copy of the develop branch of WordPress

You can see these in your VVV config, allowing you to make new sites, or remove the built in sites if you so choose.

## VVV as a MAMP/XAMPP Replacement

Multiple projects can be developed at once in the same environment.

* Use `wp-content/themes` in either the `www/wordpress-default` or `www/wordpress-develop/public_html/src` directories to develop themes.
* Use `wp-content/plugins` in either the `www/wordpress-default` or `www/wordpress-develop/public_html/src` directories to develop plugins.
* Take advantage of VVV's auto site configuration to provision additional instances of WordPress in `www/` ( see the adding a new site chapter ).
* Use the `www/wordpress-develop` directory to participate in [WordPress core](https://make.wordpress.org/core/) development.

VVV's `config`, `database`, `log` and `www` directories are shared with the virtualized server.

These shared directories allow you to work, for example, in `vagrant-local/www/wordpress-default` in your local file system and have those changes immediately reflected in the virtualized server's file system and http://local.wordpress.test/. Likewise, if you `vagrant ssh` and make modifications to the files in `/srv/www/`, you'll immediately see those changes in your local file system.

