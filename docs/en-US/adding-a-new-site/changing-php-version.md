---
category: 3. Adding a New Site
order: 4
title: Changing PHP Version
description: VVV supports the nginx_upstream option in the sites section of config/config.yml to set the PHP version.
permalink: /docs/en-US/adding-a-new-site/changing-php-version/
---

You can set the PHP version in `config/config.yml` when defining a site. To do this, use the `nginx_upstream` option to specify the PHP version in Nginx or `php` for the provisioner. VVV also needs to be told to install that version of PHP using the `utilities` section.

Here’s an example that uses PHP v7.1 for Nginx:

```yaml
sites:
  example:
    nginx_upstream: php71

utilities:
  core:
    - php71
```

**Tip:** If you add the `php` utility, it will install all available versions of PHP, skipping this step.

**Warning:** This will not work if `set $upstream {upstream};` is removed from the nginx config.

In this example, we have changed the `wordpress-default` site to use PHP 7.1, and the `wordpress-develop` site to use PHP 5.6:

```yaml
sites:
  wordpress-default:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    nginx_upstream: php71
    hosts:
      - local.wordpress.test

  wordpress-develop:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template-develop.git
    nginx_upstream: php56
    hosts:
      - src.wordpress-develop.test
      - build.wordpress-develop.test

utilities:
  core:
    - memcached-admin
    - opcache-status
    - phpmyadmin
    - webgrind
    - trusted-hosts
    - tls-ca
    - php71
    - php74
```

## Forcing a Version of PHP for Nginx

It may be desirable to force a site to use a particular version of PHP, even if `config/config.yml` disagrees.

This is done by overriding the `nginx_upstream` value inside `vvv-nginx.conf`. To do this change this:

```nginx
 set $upstream {upstream};
```

To this:

```nginx
 set $upstream php73;
```

That site is now using PHP 7.1, remember to reprovision using `vagrant reload --provision` for changes to take effect.

## Forcing a Version of PHP for the provision

In case do you need a specific PHP version used during the provision like for composer or wp cli you can do it using this parameter in the `config.yml`, as example:

```yaml
sites:
  example:
    php: 8.0

utilities:
  core:
    - php80
```

That site is now using PHP 7.1, remember to reprovision using `vagrant reload --provision` for changes to take effect.
