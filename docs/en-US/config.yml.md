---
category: 6. Reference
order: 1
title: config.yml
description: default-config.yml is the default config file that VVV uses to set itself up. Use config.yml to make changes and add your own site.
permalink: /docs/en-US/config/
---

VVV uses a config file to identify what sites it has, which software to install, and what kind of virtual machine you prefer. This file is located in at `config/config.yml`, and is created the first time you run a vagrant command by copying `config/default-config.yml`. [This is what the default config file looks like](https://raw.githubusercontent.com/Varying-Vagrant-Vagrants/VVV/stable/config/default-config.yml).

**Before VVV 3.2 the file was named `vvv-config.yml`/`vvv-custom.yml` and was located in the main folder.**

## The sites block

When defining a site, the only required item is the name of the site. This single line would be a perfectly valid site definition:

```yaml
example-site:
```

You could not visit `example-site` however unless you created a `www/example-site` folder and place a `vvv-nginx.conf` file inside it and reprovisioned.

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

This controls the folder inside the virtual machine the sites main folder is mapped on to. Note that this only works for the primary site folder, it can't be used for map arbitrary/multiple subfolders.

### local_dir

This controls which folder on the host machine VVV uses for this sites main folder. By default, it uses a folder with the sites name inside the `www` subfolder.

For example, a site named `test` would be inside the `www/test` folder. Note this only works for an entire site, it cannot be used to selectively map subfolders or sub-sections of a sites.

### php

This option sets the version of PHP used to provision and serve the site. [You can read more about it here](adding-a-new-site/changing-php-version.md).

### nginx_upstream

This option sets where Nginx passes requests to, and is primarily for setting the PHP version used. Most people should use the `php:` parameter instead to do this. [You can read more about it here](adding-a-new-site/changing-php-version.md).

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

## The extensions block

[Extensions](https://varyingvagrantvagrants.org/docs/en-US/utilities/) are repositories and packages VVV pulls in to provide additional services, such as PHPMyAdmin, TLS certificate authorities or MemcachedAdmin. You can learn more about the VVV core utilities [here](https://varyingvagrantvagrants.org/docs/en-US/utilities/).

Extensions used to be called utilities, but we renamed it after people kept creating feature requests to avoid confusion.

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
