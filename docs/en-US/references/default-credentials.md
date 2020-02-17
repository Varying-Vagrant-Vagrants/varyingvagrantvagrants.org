---
category: 6. Reference
order: 1
title: Default Credentials
description: Default usernames and passwords for databases and WordPress installations.
permalink: /docs/en-US/default-credentials/
---

All database usernames and passwords for WordPress installations included by default are:

__User:__ `wp`
__Password:__ `wp`

If you manually create a database via the root MySQL user in PHPMyAdmin or by other means, you will need to grant the `wp` user access to that database.

All WordPress admin usernames and passwords for WordPress installations included by default are:

__User:__ `admin`
__Password:__ `password`

MySQL Root:

__User:__ `root`
__Password:__ `root`

See: [Connecting to MariaDB/MySQL](https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Connecting-to-MySQL-MariaDB) from your local machine

Vagrant Box Ubuntu Root:

__User:__ `root`
__Password:__ `vagrant`

Note that it is not possible to SSH directly into the VM as `root` for security reasons. If you need to run commands as `root`, either use `sudo` or `sudo su`, both of which do not require a password when ran as the `vagrant` user

#### WordPress Stable One

* LOCAL PATH: www/wordpress-one
* VM PATH: /srv/www/wordpress-one
* URL: `http://one.wordpress.test`
* DB Name: `wordpress-one`

#### WordPress Stable Two
* LOCAL PATH: www/wordpress-two
* VM PATH: /srv/www/wordpress-two
* URL: `http://two.wordpress.test`
* DB Name: `wordpress-two`

#### WordPress Trunk  
* LOCAL PATH: www/wordpress-trunk
* VM PATH: /srv/www/wordpress-trunk
* DB Name: `wordpress_develop`
* DB Name: `wordpress_unit_tests`
