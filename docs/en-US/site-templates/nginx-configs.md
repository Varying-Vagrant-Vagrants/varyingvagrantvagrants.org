---
category: 4. Site Templates
order: 6
title: Nginx Configuration
description: VVV uses the popular Nginx to serve pages. Therefore VVV provides an include for setting up WordPress easily and a file for per site Nginx configurations.
permalink: /docs/en-US/site-templates/nginx-configuration/
---

Some sites use Apache or IIS to serve pages, but VVV uses the popular Nginx. VVV provides an include for setting up WordPress easily, and a file for setting your own Nginx configuration on a per site basis named `vvv-nginx.conf`.

{% include always_reprovision.html %}

## An Example VVV WordPress Nginx Configuration

For most WordPress sites, this NGINX configuration in `provision/vvv-nginx.conf` will suffice:

```Nginx
server {
  listen 80;
  server_name {vvv_hosts};
  root {vvv_path_to_site}/public_html;

  error_log {vvv_path_to_site}/log/error.log; # nginx error log
  access_log {vvv_path_to_site}/log/access.log; # nginx access log

  set $upstream {upstream}; # which PHP to use

  include /etc/nginx/nginx-wp-common.conf; # Makes WP paths and rewrite rules work
}
```

This will give you:

 - a webroot in the  `public_html` subfolder
 - that serves a from the `hosts` defined in the site section of `vvv-custom.yml`
 - Gives Nginx error and access logs in `log/error.log` and `log/access.log`

You will need to create the `public_html` and `log` folders if they don't exist

## What does `nginx-wp-common.conf` Do?

This is an Nginx config file provided by VVV. Including it pulls in a number of useful rules, such as PHP Fast CGI and rules for using Nginx with permalinks.

While not required, it's strongly recommended that this config file is included.

## Nginx Variable Replacements

Before VVV copies the configs to there final location, it runs a search replace routine. This allows variables containing information about the site to be used inside the Nginx config.

The config at the top of this page contains several examples. E.g. `{vvv_site_name}` is used to set the domain used, and `{vvv_path_to_site}` is used to set the root and log locations.

## Nginx Upstream

You may have noticed this line in the example above:

```Nginx
set $upstream {upstream};
```

The `{upstream}` variable is set from `vvv-custom.yml`, and is used to determine the version of PHP to use. Removing this will disable that functionality.

It may be desirable to force a site to use a particular version of PHP, for details see the [changing PHP versions](changing-php-version.md) documentation.

## Error Logs

PHP error logs are all logged to the main VVV logs folder, separated by PHP version. Per site logs are not currently available. Nginx on the other hand provides per site error and access logs:

```Nginx
error_log {vvv_path_to_site}/log/error.log;
access_log {vvv_path_to_site}/log/access.log;
```

These two lines tell Nginx where to log errors and requests to the site. In this example, the logs for the `example` site are located at `www/example/log/error.log`

Because the logs are being saved in a subfolder, it will be necessary to create the `log` folder and initial log files during provision. To do this, add these lines to `vvv-init.sh`:

```shell
# Nginx Logs
mkdir -p ${VVV_PATH_TO_SITE}/log
touch ${VVV_PATH_TO_SITE}/log/error.log
touch ${VVV_PATH_TO_SITE}/log/access.log
```

## Reference Implementation

Refer to the custom site template for a reference implementation that also includes TLS/SSL support
