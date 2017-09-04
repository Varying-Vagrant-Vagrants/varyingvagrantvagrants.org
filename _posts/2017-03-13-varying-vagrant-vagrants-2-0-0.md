---
layout: default
title:  "Varying Vagrant Vagrants 2.0.0"
date:   2017-03-13 18:00:00 -0000
author: jeremyfelt
---

Hi! Welcome to the release post for <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/releases/tag/2.0.0">Varying Vagrant Vagrants 2.0.0</a>.

## A new method for configuring VVV

One of the things that's been on the VVV wish list for [a long time](https://github.com/Varying-Vagrant-Vagrants/VVV/issues/427#issuecomment-54504156) is support for a YAML configuration file. So much gets provisioned by default, it'd be nice to have a bit more control over that.

VVV 2.0.0 introduces a [YAML configuration](https://varyingvagrantvagrants.org/docs/en-US/vvv-config/) for VVV. A `vvv-config.yml` file is provided with defaults. This can be copied to a `vvv-custom.yml` file that lets you adjust VVV to fit your needs.

Part of this feature includes making the default provisioning a bit more module. Pieces have been broken out into a handful of repositories:

* A new [VVV utilities](https://github.com/Varying-Vagrant-Vagrants/vvv-utilities) repository controls the utilities installed by default. It's now possible to manage this list and even add to it with your own utilities repo.
* A [VVV WordPress Develop](https://github.com/Varying-Vagrant-Vagrants/vvv-wordpress-develop) repository is used to make contributing to WordPress easier.
* A [VVV WordPress Default](https://github.com/Varying-Vagrant-Vagrants/vvv-wordpress-default) repository gives you the latest version of WordPress.

A really exciting part of the new configuration is how easy it is to [add a site](https://develop.varyingvagrantvagrants.org/docs/en-US/adding-a-new-site/) to your configuration. It's now possible to choose PHP 5.6, 7.0, or 7.1 for your project and the new [VVV Custom Site Template repository](https://github.com/Varying-Vagrant-Vagrants/custom-site-template) makes things even easier by providing a flexible base for new projects.

A big thanks to [Lorelei Aurora](https://github.com/LoreleiAurora) for leading this feature. It's hard to describe how excellent this improvement is.

The initial [documentation](https://varyingvagrantvagrants.org/docs/en-US/) for all of this is available, and we'll continue improving on it over the next few weeks. Please note that this is considered a **breaking change**, hence the version bump to 2.0.0. More detailed guidance on these changes can be found in the [changelog](https://varyingvagrantvagrants.org/docs/en-US/changelog/).

## A new home for documentation

Part of the process for introducing the new YAML configuration was introducing documentation for it as well. Thanks primarily to [Tom J Nowell](https://github.com/tomjn), the documentation available for VVV has improved **significantly** in this release.

Docs are included as [part of the repository](https://github.com/Varying-Vagrant-Vagrants/VVV/tree/develop/docs/en-US) and built into their final form at [varyingvagrantvagrants.org/docs/en-US/](https://varyingvagrantvagrants.org/docs/en-US/).

Over the next few months, documentation will continue to improve as content is migrated from the wiki on GitHub to the new site. A big item on the roadmap is introducing a translation workflow so that documentation can be available in any language.

## And much more

A [full changelog](https://varyingvagrantvagrants.org/docs/en-US/changelog/) is up that has all of the details for this release. Take note of the upgrade from MySQL 5.5 to MariaDB 10.1, the inclusion of the `php-memcached` package for better object cache support, and the change in how WP-CLI is installed and updated.

## Project notes

An important housekeeping item for this release is the introduction of a [governance document](https://varyingvagrantvagrants.org/docs/en-US/governance/). This helps explain how the VVV project is managed and what the various roles and responsibilities are.

And finally, as mentioned earlier in the post, [Lorelei Aurora](https://github.com/lorelieaurora) stepped in and did great work leading the implementation of the new configuration in this release. She's following this up with work on the future documentation and translation workflows. I'm excited to formally announce her role as a lead developer for VVV!

That's all for 2.0.0. Thanks so much to all of our <a href="https://github.com/Varying-Vagrant-Vagrants/VVV#varying-vagrant-vagrants">contributors</a> and thank you for using VVV!
