---
category: 3. Adding a New Site
order: 4
title: Changing PHP Version
description: VVV supports the php option in the sites section of config/config.yml to set the PHP version.
permalink: /docs/en-US/adding-a-new-site/changing-php-version/
---

You can set the PHP version in `config/config.yml` when defining a site. To do this, use the `php` option to specify the PHP version in Nginx and the provisioner. VVV also needs to be told to install that version of PHP using the `extensions` section.

Here’s an example that uses PHP v8.0:

```yaml
sites:
  phpeight:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    php: 8.0
    hosts:
      - phpeight.test

extensions:
  core:
    - php80
```

**Tip:** If you add the `php` utility, it will install all available versions of PHP, skipping this step.

**Warning:** This will not work if `set $upstream {upstream};` is removed from the nginx config.

In this example, we have changed the `wordpress-default` site to use PHP 7.1, and the `wordpress-develop` site to use PHP 5.6:

```yaml
sites:
  phpeightone:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    php: 8.1
    hosts:
      - phpeightone.wordpress.test

  phpeighttwo-develop:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template-develop.git
    php: 8.2
    hosts:
      - src.phpeighttwo-develop.test
      - build.phpeighttwo-develop.test

extensions:
  core:
    - memcached-admin
    - opcache-status
    - phpmyadmin
    - webgrind
    - trusted-hosts
    - tls-ca
    - php81
    - php82
```

## Forcing a Version of PHP

It may be desirable to force a site to use a particular version of PHP, even if `config/config.yml` disagrees.

This is done by overriding the `php` value inside `vvv-nginx.conf`. To do this change this:

```nginx
 set $upstream php81;
```

That site is now using PHP v8.1, even if `php:` or `nginx_upstream:` are set in `config/config.yml`. This still requires you to update the extensions section though as it will not automatically install that version of PHP for you. Remember to reprovision using `vagrant up --provision` for changes to take effect.

## Troubleshooting

- If your VVV install is old, you may have a `utilities` section, this was renamed to `extensions`. Do not have both at the same time.
- If you ask VVV to use a version of PHP that isn't installed, provisioning may fail, and your site will not use the requested version. Add the extension for that PHP as shown in the examples and reprovision.
- Older versions of PHP used the `nginx_upstream` option to override the PHP version. The new `php:` parameter does this and fixes the PHP version during provisioning and in the dashboard.
- The default PHP version is used in CLI, if you need to use different versions of PHP in CLI for a site you can either call that PHP version directly by swapping `php ...` for `php80 ...` or `php81 ...`, or by using `update-alternatives`. See `config/homebin/vvv_restore_php_default` for an example.
