---
category: 3. Adding a New Site
order: 4
title: Changing PHP Version
description: VVV supports the php option in the sites section of config/config.yml to set the PHP version.
permalink: /docs/en-US/adding-a-new-site/changing-php-version/
---

You can set the PHP version used by a site in `config/config.yml` by taking these 2 steps:

1. Make sure the PHP version you want is installed in the `extensions` section. For example if you want to use PHP 9.6 you would add the `php96` extension.
    - If you do not do this you will get warnings in the provisioner and changing the PHP version will fail.
2. Use the `php` option to specify the PHP version the site should use. E.g. `php: 9.6` for PHP v9.6

Here’s an example that uses PHP v8.3:

```yaml
sites:
  phpeight:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    php: 8.3
    hosts:
      - phpeight.test

extensions:
  core:
    - php83 # Not optional
```

**Tip:** If you add the `php` utility, it will install all available versions of PHP, skipping this step.

**Warning:** This will not work if `set $upstream {upstream};` is removed from the nginx config.

In this example, we've instructed VVV to install PHP v8.1 and v8.2 in the `extensions` section, then we changed the `phpeightone` site to use PHP 8.1, and the `phpeighttwo-develop` site to use PHP 8.2:

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

- If your VVV install is old, you may have a `utilities` section, this was renamed to `extensions`. Update VVV and replace `utilities:` with `extensions:`, do not have both at the same time.
- If you ask VVV to use a version of PHP that isn't installed, provisioning may fail, and your site will not use the requested version. Add the extension for that PHP as shown in the examples and reprovision.
    - If the version you're trying to add is very new we might not have added an extension for it yet! Usually we're quick to add these in advance but we're still only human.
    - If the version is old and no longer under general PHP support it may no longer be available and provisioning will fail. This is because we get PHP from the Ondrej PPA and Ondrej removes PHP versions once they become officially unsupported. This is why you can't ask for PHP v5.2 for example. See this page for details of the support lifecycles of PHP versions [https://www.php.net/supported-versions.php](https://www.php.net/supported-versions.php)
- If VVV tells you `Chosen PHP version doesn't exist in this environment` when provisioning then you did not install the needed PHP version, see the previous bullet point.
- Older versions of PHP used the `nginx_upstream` option to override the PHP version. The new `php:` parameter does this and fixes the PHP version during provisioning and in the dashboard.
- The default PHP version is used in CLI, if you need to use different versions of PHP in CLI for a site you can either call that PHP version directly by swapping `php ...` for `php80 ...` or `php81 ...`, or by using `update-alternatives`. See `config/homebin/vvv_restore_php_default` for an example.
