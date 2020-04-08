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

## VVV Nginx Substitutions

When processing site Nginx files VVV will perform some substitutions before installing the config. These are wrapped in squigly brackets `{` and `}`, for example:

```Nginx
  root {vvv_path_to_site}/public_html;
```

Here's a list:

 - `{vvv_path_to_folder}`: this is the path of the nginx config file, before substitutions and install 
 - `{vvv_path_to_site}`: this is the path to the sites folder inside the virtual machine
 - `{vvv_site_name}`: the name of the site in the config file
 - `{vvv_hosts}`: a list of the host names for this site separated by spaces
 - `{upstream}`: set to `php` by default, is used to set the upstream value and control the version of PHP FPM
 - `{vvv_tls_cert}`: the full file/folder path to the TLS certificate for this sites hosts
 - `{vvv_tls_key}`: the full file/folder path to the TLS key for this sites hosts
 
## Site Template Substitutions
 
Site templates might add new substitutions. For example the custom site template adds `{{LIVE_URL}}`. These are implemented using `sed` inside the site provisioner script. For details of these extra options, check the [ site template provisioner readme](https://github.com/Varying-Vagrant-Vagrants/custom-site-template).
