---
category: 6. Reference
order: 2
title: Update WordPress websites
permalink: /docs/en-US/references/update-wp-sites/
---

There are different ways to update a WordPress installation and this depends on what kind of template is used.

## custom-site-template/develop

This provisioners automatically updates the WordPress instance installed when `vagrant provision` is running.  
Anyway this provisioners are installing WordPress in different ways. 

### custom-site-template

This provisioner use WP-CLI to download and install so is like a native installation but only automated (as example for multisite).

### custom-site-template-develop

This provisioner use SVN or Git to download the latest trunk updated to the latest commit.  
Natively this provisioner downloads the trunk version with SVN but is possible to convert it as Git version with the `develop_git` script.  
In case it is converted this provisioner will use Git to update it.  
In both of the cases automatically will execute NPM and Grunt to update the various dependencies.

## Manual installation

WordPress installed with a manual installation can be update using the web interface or using WP-CLI without any problems. Compared to the official provisioners this doesn't include a custom path for the log files or SSL certificates and this need to be done manually.