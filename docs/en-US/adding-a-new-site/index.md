---
category: 3. Adding a New Site
order: 1
title: Adding a New Site
description: Adding a new site in VVV is as simple as adding it under the sites section of vvv-custom.yml. Create it by copying vvv-config.yml to vvv-custom.yml.
permalink: /docs/en-US/adding-a-new-site/
---

Adding a new site is as simple as adding it under the sites section of `vvv-custom.yml`. If `vvv-custom.yml` does not exist, you can create it by copying `vvv-config.yml` to `vvv-custom.yml`.

First we need to tell VVV about the site. I'm going to give the site the name `example`, with the URL `example.test`, and we'll tell VVV to use the custom site template. The custom site template will tell VVV how to download and install WordPress.

To do this, we will update the sites list by editing the file `vvv-custom.yml` in the main VVV folder like this:

```YAML
sites:

  .... other sites...

  example:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - example.test
```

Then, save `vvv-custom.yml` and run `vagrant reload --provision` to update VVV with the new site. **Always reprovision after making changes to `vvv-custom.yml`**. Be sure to indent correctly as whitespace matters in YAML files, VVV prefers to indent using 2 spaces.

Once `vagrant reload --provision` finishes, you will have a brand new WordPress install! We can now visit http://example.test to view our site, or open the `www/example` folder in an editor to start making changes to our site. To log in, use `admin` and `password`.

If you're migrating a site from VVV 1, read this page, then visit the [migration page](migrating-vvv1.md) for further details.

You may also find that the default sites created by VVV are enough for what you need. [Read about the default sites here](../references/default-sites.md)

At this point, mysql or phpMyAdmin can be used to upload a database for content, and plugins/themes/uploads can be copied. The installation of WP will be in `www/example/public_html`, and a PHP error log will be located at `www/example/logs/`.

All the default parameters are:
```
  nginx_upstream: php72 # Specific the PHP version of the website
  branch: your-branch # Git branch to use for the provisioner
  repo: # Repository
  hosts: # Multiline parameter to specificy the various hosts
  vm_dir: /path/ # Specify the custom path in your machine to use it
  custom: # Multiline parameter to specificy the various custom parameters of the provisioner
```

{% include always_reprovision.html %}
