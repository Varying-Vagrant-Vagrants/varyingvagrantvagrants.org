---
layout: page
title: vvv-config.yml - Sites
permalink: /documentation/vvv-config/sites/
---

This key is where you define all sites in the installation. If a site is not defined here it will not be provisioned.

Each key in this array should be the name of the dir in the www folder _followed by a colon_ unless you define both `vm_dir` and `local_dir`.

### Options

All of these are optional.

__repo:__
The git repository to pull the site config from.

__vm_dir:__ 
Default: /srv/www/{SITE NAME}

The path to the site within the VM.

__local_dir:__
Default: {VAGRANT_DIR}/www/{SITE NAME}

The path to the site on the host system.
(This can be outside of the VVV directory.)

__allow_customfile:__
Default: false

If a Customfile exists in the site dir should we include it?   

__skip_provisioning:__
Default: false

Should we skip running this sites provisioner?  

### Examples

__The minimum viable config.__

```yaml
sites:
  example-site:
```

__A configuration with just the git repository defined.__

```yaml
sites:
  wordpress-meta-environment: https://github.com/WordPress/meta-environment.git
```

__A configuration with all options defined.__

```yaml
sites:
  wordpress-default:
    repo: https://github.com/Varying-Vagrant-Vagrants/vvv-wordpress-develop.git
    vm_dir: '/srv/www/wordpress-develop-custom-path'
    local_dir: '../wordpress-develop'
    allow_customfile: false 
    skip_provisioning: false
```
