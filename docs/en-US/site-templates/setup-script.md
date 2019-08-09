---
category: 4. Site Templates
order: 5
title: Setup Script
description: VVV runs vvv-init.sh when it sets up the site to give you an opportunity to execute shell commands.
permalink: /docs/en-US/site-templates/setup-script/
---

`vvv-init.sh` is ran when VVV sets up the site, and gives you an opportunity to execute shell commands, including WP CLI commands. This file is optional, but when combined with a git repository this becomes very powerful.

Your script might:
 - Download and install the latest WordPress
 - Update and install plugins
 - Checkout extra git repos
 - Run `composer install` and other dependency managers and task runners
 - Create an empty database if it doesn't exist and fill it with starter content

{% include always_reprovision.html %}


You can find [an example of a site provisioner here](https://github.com/Varying-Vagrant-Vagrants/custom-site-template/blob/master/provision/vvv-init.sh).

That script will:

 - Check if a mysql database exists, if it doesn't, create one and grant the needed priviledges
 - Make sure the NGINX error logs are created
 - Download, configure and install a fresh copy of WordPress or update the currently installed version of WordPress.
 - Do other miscellaneous tasks like SSL certificate setup, setting locale, installing plugins, checking for multisite, etc
 
