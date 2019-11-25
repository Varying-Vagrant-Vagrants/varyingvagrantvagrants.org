---
category: 6. Reference
order: 10
title: Removing Sites
description: There are several ways to remove a site in VVV.
permalink: /docs/en-US/references/removing-sites/
---

You have 3 options:

 - Skip provisioning
 - Comment out the site entry
 - Remove the site completely

## Skip Provisioning

By setting `skip_provisioning` to true in `config/config.yml`, VVV will pretend the site does not exist. It will not attempt to provision the site, set up its hosts, etc.

This is very useful if you want to disable a site to speed up provisioning, or because you aren't working on it, while preserving the ability to come back to it at a later date.

For example:

```YAML
  wordpress-default:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    skip_provisioning: true
    hosts:
      - local.wordpress.test
```

Remember that you need to reprovision VVV when changing this. The site will also be listed on the dashboard at `vvv.test` but will be listed as skipped.

Changing the value back to `false` and reprovisioning will reactivate the site

## Commenting Out The Site

You can comment out the site in the config file, but this is no different to using `skip_provisioning`. Additionally, the site will no longer be listed on the dashboard at `vvv.test`.

E.g.


```YAML
#  wordpress-default:
#    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
#    skip_provisioning: false
#    hosts:
#      - local.wordpress.test
```

## Removing A Site Completely

There are multiple steps to doing this:

 - Remove the site from `vvv-custom.yml` and save
 - Reprovision
 - Delete its folder
 - Delete its database
 
 Reprovisioning will remove host entries and Nginx config files
 
 ### Why not Automatically Remove Sites?
 
 We could auto-remove sites when they're removed from `config/config.yml`, but this leads to several problems:
 
  - Any typos or mistakes in `config/config.yml` would lead to bulk site removal, and accidental destruction of data
  - DB's are created by provisioner scripts, so VVV core has no insight to know which databases it can remove. This also becomes a problem for shared databases
  - Commenting out a site would delete all of its files and content
 
 For these reasons, site removal is a manual process, as this ensures it's intentional, and prevents accidental deletion.
 
