---
category: 2. Getting Started
order: 3
title: Default sites in VVV
description: VVV creates and sets up several WordPress installs for you automatically.
permalink: /docs/en-US/references/default-sites/
---

## What are the Default Sites?

VVV creates and sets up several WordPress installs for you automatically, these are:

 - [http://one.wordpress.test](http://one.wordpress.test) - A standard WP install, useful for building plugins, testing things, etc
 - [http://two.wordpress.test](http://two.wordpress.test) - A standard WP install, useful for building plugins, testing things, etc
 - [http://trunk.wordpress.test](http://trunk.wordpress.test) - An svn based WP Core trunk dev setup, useful for contributor days, Trac tickets, patches

You can see these in your VVV config, allowing you to make new sites, or remove the built in sites if you so choose.

## VVV as a MAMP/XAMPP Replacement

Multiple projects can be developed at once in the same environment. You can reuse the `one.wordpress.test` site by putting your themes and plugins in the `www/wordpress-one/public_html/wp-content` folder.

Or, you can create as many new sites as you want by taking advantage of VVV's auto site configuration to provision additional instances of WordPress in `www/` ( see the adding a new site chapter ).

VVV's `config`, `database`, `log` and `www` directories are shared with the virtualized server.

These shared directories allow you to work, for example, in `vagrant-local/www/wordpress-one` in your local file system and have those changes immediately reflected in the virtualized server's file system and http://one.wordpress.test/. Likewise, if you `vagrant ssh` and make modifications to the files in `/srv/www/`, you'll immediately see those changes in your local file system.

