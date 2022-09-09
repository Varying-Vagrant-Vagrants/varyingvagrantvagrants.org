---
category: 3. Adding a New Site
order: 4
title: Changing PHP Version
description: VVV supports the nginx_upstream option in the sites section of config/config.yml to set the PHP version.
permalink: /docs/en-US/adding-a-new-site/changing-php-version/
---

You can set the PHP version in `config/config.yml` when defining a site. To do this, use the `nginx_upstream` option to specify the PHP version. VVV also needs to be told to install that version of PHP using the `utilities` section.

Here’s an example that uses PHP v8.0:

```yaml
sites:
  phpeight:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    nginx_upstream: php80
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

extensions:
  core:
    - memcached-admin
    - opcache-status
    - phpmyadmin
    - webgrind
    - trusted-hosts
    - tls-ca
    - php56
    - php71
```

## Forcing a Version of PHP

It may be desirable to force a site to use a particular version of PHP, even if `config/config.yml` disagrees.

This is done by overriding the nginx upstream value inside `vvv-nginx.conf`. To do this change this:

```nginx
 set $upstream {upstream};
```

To this:

```nginx
 set $upstream php71;
```

That site is now using PHP 7.1, remember to reprovision using `vagrant reload --provision` for changes to take effect.

## Troubleshooting

- If your VVV install is old, you may have a `utilities` section, this was renamed to `extensions`. Do not have both at the same time.
- If you ask VVV to use a version of PHP that isn't installed, provisioning may fail, and your site will not use the requested version. Add the extension for that PHP as shown in the examples and reprovision.
