---
category: 5. Troubleshooting
order: 3
title: Logs
description: Where and what the log files are
permalink: /docs/en-US/troubleshooting/logs/
---

VVV maintains a `log` folder, with several subfolders:

 - memcached
 - nginx
 - php
 - provisioners

The provisioners folder contains full log output for each provisioner, grouped into folders by date and time.

## PHP Error Logs

You can find PHP fpm and error logs in the `logs/php` folder, grouped by PHP version.

Additionally, `WP_DEBUG_LOG` can be used in `wp-config.php` to control where a WordPress site logs its PHP errors to.

### Per Site PHP error logs

Unfortunately, it's not possible to have separate log files for each site using the same PHP-FPM, however each error contains the path of the file which can be used to seperate different sites.

For more contextual error handling, look at using XDebug.

## Nginx Access Logs

The main log file is in `log/nginx`, however, individual sites have a `log` subfolder with site specific access and error logs. These are defined in the nginx configuration of that site.

## Email

We do not log emails to a file, instead VVV provides MailHog which intercepts all emails and presents them in a GUI.

## Provisioner Output

By default, site and utility provisioners only show errors in the terminal when provisioning. The full output is logged to a file. For example:

 - `log/provisioners/2020.04.07_15-48-16/provisioner-main.log`
 - `log/provisioners/2020.04.07_15-48-16/provisioner-site-wordpress-one.log`
 - `log/provisioners/2020.04.07_15-48-16/provisioner-utility-core-tls-ca.log`

## Other Logs

Other logs may exist inside the virtual machine, e.g. MariaDB logs. You can SSH or SFTP into the virtual machine to view these.

