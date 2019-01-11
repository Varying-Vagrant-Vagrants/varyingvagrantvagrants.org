---
layout: default
title:  "Varying Vagrant Vagrants 2.2.1"
date:   2018-05-22 22:00:00 -0000
author: tomjn
---

Hi! Welcome to the release post for <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/releases/tag/2.2.1">Varying Vagrant Vagrants 2.2.1</a>. For help updating, see the documentation on [keeping VVV up to date](https://varyingvagrantvagrants.org/docs/en-US/installation/keeping-up-to-date/).

Here's what's happening...

## Vagrant Triggers and Vagrant 2.1

VVV now requires Vagrant 2.1 to run. The Vagrant triggers plugin is also no longer required, as it was merged into Vagrant 2.1.

This does mean that users with the triggers plugin installed will get a warning when using vagrant commands. Read the warning for a parameter that can be added to silence the warning if you still need vagrant triggers for pre-2.1 vagrant environments. Otherwise, uninstall vagrant triggers with the following command:

```
vagrant plugin uninstall vagrant-triggers
```

## PHP 7.2

VVV now uses PHP 7.2 by default. [See here on how to change a sites PHP version](https://varyingvagrantvagrants.org/docs/en-US/adding-a-new-site/changing-php-version/).

## TLS

Testing with `https` is an important part of development, so we've added a new `TLS-CA` utility, that comes with new installs by default. This installs a certificate authority just for your machine, letting you test `https://` addresses locally.

To use this, add the utility, and reprovision. Then, you need to tell your OS or browser to accept the root certificate for the authority. This tells your computer to trust any certificates it generates, without which you'll get a warning when visiting sites. This can be found in your VVV folder under `certificates/ca/ca.crt`.

[For more information, see our docs here](https://varyingvagrantvagrants.org/docs/en-US/references/https/)

## Custom Site Template Develop and Deprecations

The `wordpress-develop` repository has been deprecated! This old site template was hardcoded to a single URL, and had other issues. It's replaced by `custom-site-template-develop`, which allows for multiple WP core development environments.

Additionally, the `src.` subdomain is going away due to changes in the WP core development process.

## Logs

Logs are now in the `/var/log` folder, which is mounted on to the `log` folder in your install. In particular, the default Nginx log, and the MariaDB logs are now in `/var/log`

## Dashboard

Is now a separate git repo! And updates independently of VVV on `vagrant provision`. You can also override the dashboard in `vvv-custom.yml` via the `dashboard` options:

```
dashboard:
  repo: ....
  branch; ...
```

## Project Notes

We've added a new contributor team for testers and reviewers, [Benjamin Lu](https://github.com/benlumia007) and [Daniele Scasciafratte](https://github.com/Mte90). They've been very helpful in issues and testing changes. We've also added [Tom J Nowell](http://github.com/tomjn/) as a lead developer.
