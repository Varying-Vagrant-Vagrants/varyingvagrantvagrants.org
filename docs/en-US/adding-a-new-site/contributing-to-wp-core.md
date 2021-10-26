---
category: 3. Adding a New Site
order: 9
title: Contributing to WP Core
description: Creating a site for developing WP Core.
permalink: /docs/en-US/adding-a-new-site/contributing-to-wp-core/
---

## Contributing to WordPress Core

If you wish to test the bleeding edge or contribute to future versions of WordPress core, you can use the `custom-site-template-develop` site template. Visit [the github readme for the custom site template develop](https://github.com/Varying-Vagrant-Vagrants/custom-site-template-develop/blob/master/README.md) to see more information about parameters and options, including examples.

**Note:** For everyday client work, such as plugin or theme development, use a normal site template. This template is for contributor days, and testing/patching WordPress itself

The default VVV config comes with a disabled site that uses this template, just change `skip_provisioning: true` to `skip_provisioning: false`, then reprovision VVV.

## Contributing to WordPress Meta

There _was_ a meta environment maintained by the WordPress team, but it's unmaintained. For more informatiion as well as its replacements, visit [the meta-environment github repository](https://github.com/WordPress/meta-environment), or ask in the meta channel in the WordPress slack.
