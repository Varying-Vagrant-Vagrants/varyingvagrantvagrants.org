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

## An Example

Check on [GitHub](https://github.com/Varying-Vagrant-Vagrants/custom-site-template/blob/master/provision/vvv-init.sh) the original `custom-site-template` code that is upadted to the latest revision.

This script will:

 - Associate the VVV `/etc/hosts` file with your domain
 - Check if a mysql database exists, if it doesn't, create one and grant the needed priviledges
 - Make sure the NGINX error logs are created
 - Download, configure and install a fresh copy of WordPress or update the currently installed version of WordPress.
 - Do other miscellaneous tasks like certificate creations, set locale, install plugins check multisite and so on
 
