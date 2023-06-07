---
category: 3. Adding a New Site
order: 1
title: Adding a New Site
description: Adding a new site in VVV is as simple as adding it under the sites section of `config.yml`.
permalink: /docs/en-US/adding-a-new-site/
---

Adding a new site is as simple as adding it under the sites section of `config.yml` then reprovisioning. If `config/config.yml` does not exist, run `vagrant status` and it will be created for you.

A VVV site in `config.yml` will have a name, a provisioner `repo:` that tells VVV how to install software such as WordPress, and `hosts` that tell it the top level domains to serve the site on. We use the `.test` TLD as it's protected by RFCs and designed for local development ( `.local` has more restrictions and is used by Bonjour/Zeroconf ).

## Examples

Here are several examples of sites that can be added to `config/config.yml` in the `sites:` section:

[WordPress Site](#wordpress-site){: .btn}
[WordPress Sub-directory Multisite](#wordpress-sub-directory-multisite){: .btn}
[WordPress Sub-domain Multisite](#wordpress-sub-domain-multisite){: .btn}
[WordPress Core Dev Environment](#wordpress-core-dev-environment){: .btn}
[WordPress.org Meta Environment](#wordpressorg-meta-environment){: .btn}
[WordPress Nightly Site](#wordpress-nightly-site){: .btn}
[Empty Custom Site](#empty-custom-site){: .btn}
[A site with a wp-content git repo](#a-site-with-a-wp-content-git-repo){: .btn}
[Drupal](#drupal){: .btn}
[CraftCMS](#craftcms){: .btn}
[VIP Go](https://docs.wpvip.com/how-tos/set-up-a-vip-go-local-development-site/#h-step-2-add-a-new-site-and-site-settings){: .btn target="_blank"}
[Adding An Existing Site](adding-an-existing-site.md){: .btn}

{% include always_reprovision.html %}

### WordPress Site

```yaml
sites:
  example:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - example.test
```

This creates a site named `example` with a WordPress install at `http://example.test` in the `www/example/public_html` folder.

The `repo` parameter tells VVV we want a WordPress site and downloads install instructions. The `hosts` parameter tells VVV the domain to use for the site.

Then, save `config/config.yml` and run `vagrant up --provision` to update VVV with the new site. Be sure to indent correctly as whitespace matters in YAML files, VVV prefers to indent using 2 spaces.

{% include always_reprovision.html %}

Once `vagrant up --provision` finishes, you will have a brand new WordPress install! We can now visit http://example.test to view the site, or open the `www/example` folder in an editor to start making changes to our site. To log in, use `admin` and `password`.

### WordPress Sub-directory Multisite

```yaml
sites:
  multisite-subdir:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - multisite.test
    custom:
      wp_type: subdirectory
```

This creates a subdirectory based multisite named `multisite-subdir` at `http://multisite.test` in the `www/multisite-subdir/public_html` folder.

### WordPress Sub-domain Multisite

```yaml
sites:
  multisite-subdomain:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - subdomainmultisite.test
      - one.subdomainmultisite.test
      - two.subdomainmultisite.test
    custom:
      wp_type: subdomain
```

This creates a subdomain multisite named `multisite-subdomain` at `http://subdomainmultisite.test` in the `www/multisite-subdomain/public_html` folder. You will need to update the `hosts` section and reprovision when adding new subdomains to the multisite. We recommend doing this in advance.

### WordPress Core Dev Environment

```yaml
sites:
  wordpress-trunk:
    description: "An svn based WP Core trunk dev setup, useful for contributor days, Trac tickets, patches"
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template-develop.git
    hosts:
      - trunk.wordpress.test
```

This creates a WordPress core dev site named `wordpress-trunk` at `http://trunk.wordpress.test` in the `www/wordpress-trunk/public_html` folder.

This is useful for contributing to new WordPress releases, testing patches, or making fixes. This is not optimal for client work on plugins and themes.

### WordPress.org Meta Environment

```yaml
sites:
  wordpress-meta-environment:
    description: "An environment useful for contributions to the WordPress meta team."
    repo: https://github.com/WordPress/meta-environment.git
    hosts:
      - wp-meta.test
    custom:
      provision_site:
        "buddypressorg.test": true
        "jobs.wordpressnet.test": true
        "wordcamp.test": true
        "wordpressorg.test": true
        "wordpresstv.test": true
```

This creates a collection of sites for working on WordPress.org named `wordpress-meta-environment` at `http://wp-meta.test` in the `www/wordpress-meta-environment/public_html` folder.

Provisioning this site takes a longer time, so be patient. It can be used to work on WordPress TV, WordCamps, and other .org sites.

### WordPress Nightly Site

```yaml
sites:
  nightly:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - wpnightly.test
    custom:
      wp_type: nightly
```

This creates a WP Nightly site named `nightly` at `http://wpnightly.test` in the `www/nightly/public_html` folder. This is useful for testing themes and plugins with unreleased versions of WordPress.

### Empty Custom Site

```yaml
sites:
  foobar:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - mysite.test
    custom:
      wp_type: none
```

This creates a site named `foobar` with an empty `public_html` folder to put a static site or PHP application at `http://mysite.test` in the `www/foobar/public_html` folder.

You might do this if you have an existing site, or want to manually install WordPress or competing software.

### A Site With a wp-content Git Repo

```yaml
sites:
  acmecorp:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - acme.test
    folders:
      public_html/wp-content/:
        git:
          repo: repo to clone...
          overwrite_on_clone: true
```

This creates a WP site named `acmecorp` at `http://acme.test` in the `www/acmecorp/public_html` folder. The specified git repo will be cloned to `public_html/wp-content`, and the existing folder will be deleted and replaced with the git repo if cloning has not happened yet.

[Click here for more information about custom git checkouts and folders.](folders.md)

### Drupal

```yaml
sites:
  drupal-site:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - drupal.test
    folders:
      public_html:
        composer:
          create-project: drupal/recommended-project
    custom:
      wp_type: none
```

This creates a Drupal site named `drupal-site` at `http://drupal.test` in the `www/drupal-site/public_html` folder. You will need to create a database using PHPMyAdmin for this site.

### CraftCMS

```yaml
sites:
  craft:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - craft.test
    folders:
      public_html:
        composer:
          create-project: craftcms/craft
    custom:
      wp_type: none
```

This creates a Craft CMS site named `cratt` at `http://craft.test` in the `www/craft/public_html` folder.

After provisioning, you will need to complete setup by following [the official Craft CMS install instructions](https://craftcms.com/docs/3.x/installation.html).

### Additional Options

The custom site template supports options such as changing the version of WordPress, database names, site titles, and more. [For a full list of what the official site template supports,  check the readme on Github](https://github.com/Varying-Vagrant-Vagrants/custom-site-template).

### Migrating from VVV 1.x

If you're migrating a site from VVV 1, read this page, then visit the [migration page](migrating-vvv1.md) for further details.

### Default Sites

VVV provides a number of default sites, and some that are disabled by default. If you can repurpose these then no config modification is necessary.

You may also find that the default sites created by VVV are enough for what you need. [Read about the default sites here](../references/default-sites.md).

### Importing a Production Database

At this point, mysql or phpMyAdmin can be used to upload a database for content, and the plugins/themes/uploads folders can be copied. The installation of WP will be in `www/example/public_html`.


### PHP Error Logs

PHP error logs are located in the main VVV folder in `logs/php/`. Note that if your site specified `WP_DEBUG_LOG` then WordPress will redirect PHP error logs to `wp-content/debug.log` by default.

### Official Site Templates

The site templates officially supported by VVV project are:

* [https://github.com/Varying-Vagrant-Vagrants/custom-site-template](https://github.com/Varying-Vagrant-Vagrants/custom-site-template) - For when you just need a simple dev site
* [https://github.com/Varying-Vagrant-Vagrants/custom-site-template-develop](https://github.com/Varying-Vagrant-Vagrants/custom-site-template-develop) - For working with WP Core development

These can also be forked for custom provisioners. If you want to fork the site template, be sure to change the `repo` value to point to your new location.

{% include always_reprovision.html %}
