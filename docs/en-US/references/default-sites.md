---
category: 2. Getting Started
order: 3
title: Default sites in VVV
permalink: /docs/en-US/references/default-sites/
---

## What are the Default Sites?

VVV creates and sets up several WordPress installs for you automatically, these are:

 - [http://local.wordpress.dev](http://local.wordpress.dev) - a standard WordPress install
 - [http://src.wordpress-develop.dev](http://src.wordpress-develop.dev) and [http://build.wordpress-develop.dev](http://build.wordpress-develop.dev) - a copy of the develop branch of WordPress

You can see these in your VVV config, allowing you to make new sites, or remove the built in sites if you so choose.

## VVV as a MAMP/XAMPP Replacement

Multiple projects can be developed at once in the same environment.

* Use `wp-content/themes` in either the `www/wordpress-default` or `www/wordpress-develop/src` directories to develop themes.
* Use `wp-content/plugins` in either the `www/wordpress-default` or `www/wordpress-develop/src` directories to develop plugins.
* Take advantage of VVV's [auto site configuration](https://github.com/varying-vagrant-vagrants/vvv/wiki/Auto-site-Setup) to provision additional instances of WordPress in `www/`. The [Variable VVV](https://github.com/bradp/vv) project helps to automate this process.
* Use the `www/wordpress-develop` directory to participate in [WordPress core](https://make.wordpress.org/core) development.

VVV's `config`, `database`, `log` and `www` directories are shared with the virtualized server.

These shared directories allow you to work, for example, in `vagrant-local/www/wordpress-default` in your local file system and have those changes immediately reflected in the virtualized server's file system and http://local.wordpress.dev/. Likewise, if you `vagrant ssh` and make modifications to the files in `/srv/www/`, you'll immediately see those changes in your local file system.

