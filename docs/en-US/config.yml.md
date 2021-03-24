---
category: 6. Reference
order: 1
title: config.yml
description: default-config.yml is the default config file that VVV uses to set itself up. Use config.yml to make changes and add your own site.
permalink: /docs/en-US/config/
---

`config/default-config.yml` is the default config file that VVV uses to set itself up. Copy this file to `config/config.yml` to make changes and add your own site.

**Before VVV 3.2 the file was `vvv-config.yml` and `vvv-custom.yml` in the VVV root.**

Here's the full default config file:

```yaml
---

# This file is a YAML formatted file. YAML indenting is done in spaces not
# tabs, and whitespace is significant. If you don't stick to this, it will
# fail on provision

#
# IMPORTANT, if you change this file, you have to reprovision,  no exceptions
# Do this by running either this command:
# vagrant reload --provision

# Or, if your machine is already turned on:
# vagrant provision
#

# These are your websites, and their names map on to the folders they're
# located in. See the docs for how to define these, and what all the keys
# and options are
sites:

  # latest version of WordPress, can be used for client work and testing
  # Check the readme at https://github.com/Varying-Vagrant-Vagrants/custom-site-template
  wordpress-one:
    skip_provisioning: false
    description: "A standard WP install, useful for building plugins, testing things, etc"
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - one.wordpress.test
    custom:
      wpconfig_constants:
        WP_DEBUG: true
        WP_DEBUG_LOG: true
        WP_DISABLE_FATAL_ERROR_HANDLER: true # To disable in WP 5.2 the FER mode

  wordpress-two:
    skip_provisioning: false
    description: "A standard WP install, useful for building plugins, testing things, etc"
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    custom:
      # locale: it_IT
      delete_default_plugins: true
      install_plugins:
        - query-monitor
    hosts:
      - two.wordpress.test

  # The following commented out site configuration will create a standard WordPress
  # site in www/example-site/ available at http://mysite.test.
  # Remember, whitespace is significant! Tabs and spaces mean different things
  #mysite:
  #  description: "My website"
  #  repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
  #  hosts:
  #    - mysite.test

  # The wordpress-develop configuration is useful for contributing to WordPress Core.
  # It uses the built WP to serve the site
  wordpress-trunk:
    skip_provisioning: true # provisioning this one takes longer, so it's disabled by default
    description: "An svn based WP Core trunk dev setup, useful for contributor days, Trac tickets, patches"
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template-develop.git
    hosts:
      - trunk.wordpress.test

  # The following commented out site configuration will create a environment useful
  # for contributions to the WordPress meta team, .e.g WordCamps, .org, etc:
  wordpress-meta-environment:
    skip_provisioning: true # disabled by default, this takes a long time to provision
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

  # The following commented out site configuration will create a standard WordPress
  # site in www/example-site/ available at http://my-example-site.test.
  # Remember, whitespace is significant! Tabs and spaces mean different things
  #example-site:
  #  repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
  #  hosts:
  #    - my-example-site.test

# Utilities https://varyingvagrantvagrants.org/docs/en-US/utilities/
# are system level items that aren't websites, that install tools or packages
# the core utilities install tools such as phpmyadmin
utilities:
  core: # The core VVV utility
    - tls-ca # HTTPS SSL/TLS certificates
    - phpmyadmin # Web based database client
    #- memcached-admin # Object cache management
    #- opcache-status # opcache management
    #- webgrind # PHP Debugging
    #- mongodb # needed for Tideways/XHGui
    #- tideways # PHP profiling tool, also installs xhgui check https://varyingvagrantvagrants.org/docs/en-US/references/tideways-xhgui/
    #- nvm # Node Version Manager
    #- php56
    #- php70
    #- php71
    #- php72
    #- php73
    #- php74

# vm_config controls how Vagrant provisions the virtual machine, and can be used to
# increase the memory given to VVV and the number of CPU cores.
# It can also be used to override the default provider being used within Vagrant.

vm_config:
  # For WP core development we recommend at least 2GB ( 2048 ),
  # If you have 4GB of RAM, lower this to 768MB or you may encounter issues
  memory: 2048
  # CPU cores:
  cores: 2

  # this tells VVV to use the prebuilt box copied from the USB drive at contributor days
  # once set to false, do not change back to true, and reprovision
  # wordcamp_contributor_day_box: false

  # Due to a limitation within Vagrant, the specified provider is only respected on a clean `vagrant up`
  # as Vagrant currently restricts you to one provider per machine
  # https://www.vagrantup.com/docs/providers/basic_usage.html#vagrant-up
  # provider: virtualbox
  # provider: hyperv
  # provider: parallels
  # provider: vmware_desktop

# General VVV options
general:
  # Backup the databases to the database/backups subfolder on halt/suspend/destroy, set to false to disable
  db_backup: true
  # Import the databases if they're missing from backups
  db_restore: true
  # set to true to use a synced shared folder for MariaDB database storage
  db_share_type: false
  # GitHub token to use from composer
  #github_token: xxxxxx

# Settings for the vagrant plugins supported by VVV
vagrant-plugins:
  disksize: 10GB # requires the disk size vagrant plugin
```

You can also always find the current default config [on GitHub](https://raw.githubusercontent.com/Varying-Vagrant-Vagrants/VVV/stable/config/default-config.yml).

## The sites block

When defining a site, the only required item is the name of the site. This single line would be a perfectly valid site definition:

```yaml
example-site:
```

Note that site provisioners may add their own custom values, see the [custom-site-template](https://github.com/Varying-Vagrant-Vagrants/custom-site-template/blob/master/README.md) documentation on GitHub for information on what is supported.

### skip_provisioning

If there are a lot of sites in `config/config.yml`, you may want to skip several sites that aren't in use. To do this, set the `skip_provisioning` key, for example:

```yaml
sites:
  wordpress-one:
    skip_provisioning: true
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
```

Now VVV will skip that site when running the provisioner. This means that the hosts, nginx config, and `vvv-init.sh` script will not be copied or ran.

### description

The `description` key allows you to provide an optional description which will be displayed in the VVV dashboard.

### repo

This specifies a git repository that contains the site to be provisioned. If set, VVV will grab the git repo, place it in the appropriate place, and provision the site.

There's also a shorthand version:

```yaml
example-site: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
```

### branch

If the `repo` key is being used, and the `branch` key is set, VVV will checkout that branch instead of `master`.

### vm_dir

This controls the folder inside the virtual machine the sites folder is mapped on to.

### local_dir

This controls which folder on the host machine VVV uses for this site. By default, it uses a folder with the sites name inside the `www` subfolder.

For example, a site named `test` would be inside the `www/test` folder.

### nginx_upstream

This option sets where Nginx passes requests to, and is primarily for setting the PHP version used. [You can read more about it here](adding-a-new-site/changing-php-version.md).

### hosts

This defines the domains and hosts for VVV to listen on. If a vagrant host plugin is installed, your hosts file will automatically be updated when the machine is turned on and off.

```yaml
hosts:
  - one.wordpress.test
```

### custom

This allows setting various overrides for the site. In the `default-config.yml` file above, you can see how it is being used to set various wordpress constants:

```yaml
custom:
  wpconfig_constants:
    WP_DEBUG: true
    WP_DEBUG_LOG: true
```

## The utilities block

[Utilities](https://varyingvagrantvagrants.org/docs/en-US/utilities/) are repositories and packages VVV pulls in to provide additional services, such as PHPMyAdmin, TLS certificate authorities or MemcachedAdmin. You can learn more about the VVV core utilities [here](https://varyingvagrantvagrants.org/docs/en-US/utilities/).

[Additional versions of PHP](adding-a-new-site/changing-php-version.md) may also be added here.

## The vm_config block

The `vm_config` section controls how Vagrant provisions the virtual machine, and can be used to increase the memory given to VVV and the number of CPU cores, along with the provider for the machine. For WP core development, we recommend at least 2GB (`2048`) of memory. If you have 4GB of system memory, lower this to `768` or you may encounter issues.

This configuration would tell VVV to create a virtual machine with 4GB of RAM and a single CPU core:

```yaml
vm_config:
  memory: 4096
  cores: 1
```

VVV uses VirtualBox by default, but you can set the `provider` key to specify `hyperv`, `parallels`, or `vmware_desktop`.

## The general block

This section defines options which are specific to VVV.

### db_backup

Backup the databases to the database/backups subfolder on halt/suspend/destroy, set to false to disable.

### db_restore

Imports the databases if they're missing from backups, set to false to disable.

### db_share_type

Set to true to use a synced shared folder for MariaDB database storage, could create issues on different systems. This is `false`/off by default

### github_token

Tells composer can use a GitHub token to speed up download and avoid rate limiting issues when downloading packages.

## vagrant-plugins

This section is used for settings for the plugin supported by VVV, use as reference the config.yml file.
