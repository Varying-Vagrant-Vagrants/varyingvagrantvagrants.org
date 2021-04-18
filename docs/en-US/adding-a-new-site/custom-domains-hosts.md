---
category: 3. Adding a New Site
order: 3
title: Custom Domains and Hosts
description: Define custom domains in the sites section of config/config.yml. vvv-init.sh can be used for edge circumstances.
permalink: /docs/en-US/adding-a-new-site/custom-domains-hosts/
---

There are 3 ways to define hosts

 - The main `config/config.yml` config file
 - A `vvv-hosts` file
 - The `vvv-init.sh` file

The recommended way is to use the `config/config.yml` file. `vvv-hosts` is supported for backwards compatibility, and `vvv-init.sh` can be used for edge circumstances.

When changing hosts, the Nginx config will need updating so that Nginx knows to listen for requests on those domains. If this isn't done, the VVV dashboard will appear instead of the desired site. If the `vagrant-goodhosts` plugin is installed ([See the requirements](../installation/software-requirements.md)), this will also add the domain to your machine's HOST file.

{% include always_reprovision.html %}

## config/config.yml

When adding a site in `config/config.yml`, add a hosts section listing the domains of that site. For example:

```yaml
example:
  ....
  hosts:
    - example.com
```

This will map `example.com` to the `example` site, and update the hosts file on your machine.

## vvv-hosts files

VVV 1 added hosts using a file named `vvv-hosts`, and VVV 2 continues support for this for backwards compatibility reasons. `config.yml` should always be preferred.

Place this as a text file with no file extension in a `provision` subfolder, or in the root of the site. Here's an example that adds 2 domains:

```
example.com
example.net
```

For fast performance, put `vvv-hosts` in the root of the site, or a `.vvv/provision` subfolder. This will avoid a 3 level deep folder search.

Note that VVV will not add these hosts the first time you add the site. This is because the VVV updates the hosts file _before_ sites are set up. The second time you reprovision it will be added.
