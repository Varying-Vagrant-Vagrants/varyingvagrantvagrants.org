---
category: 3. Adding a New Site
order: 5
title: Custom Nginx Configs
description: How to configure a custom Nginx config file for a site.
permalink: /docs/en-US/adding-a-new-site/custom-nginx/
---

By default, VVV copies a `vvv-nginx.conf` file into place. The site templates create this by modifying a `vvv-nginx-default.conf` file and renaming it. If you want to use a custom nginx file, create a `vvv-nginx-custom.conf` file and this will be used instead.

This is useful if you wish to implement or change Nginx rules. For example, using a subdirectory installation of WordPress.

It may also be necessary to replace the nginx wp common rules. VVV does this using an include statement, but you could replace this with the contents of that file. It can be found in `config/nginx-config/nginx-wp-common.conf`. Note that VVV will only copy the final Nginx config file, it won't copy over includes.