---
category: 4. Site Templates
order: 1
title: Site Templates
description: How to predefine a site.
permalink: /docs/en-US/site-templates/
---

A site template is a git repo that contains scripts and files for setting up a VVV site automatically.

## Using a Site Template

To use a site template, add a `repo:` field to a site with the URL of a git repository. VVV uses key forwarding, which allows private repositories to be used via SSH. VVV will do a `git clone`, and `git pull`s, then run provisioning files to set that site up. This can be used to install WordPress, themes, and plugins, SQL imports, etc. It could even be used for non-WordPress sites.

Most VVV sites use the custom site template repository, which also acts as a reference implementation.

## The Provision Folder

When setting up a site, VVV looks for several files in the `provision` subfolder in the following order:

 - `provision/vvv-init.sh`
 - `provision/vvv-nginx.conf`

Because `vvv-init.sh` is loaded first, it can be used to create the other files. An optional `vvv-hosts` file can be used, and is maintained for backwards compatibility with sites created for VVV v1.x.

### `provision/vvv-init.sh`

This file is a shell script that sets up the site. This is an opportunity to download software, configure, and install, or update.

[Read about `vvv-init.sh`](setup-script.md)

### `provision/vvv-nginx.conf`

This is the Nginx configuration for this site, that gets installed by VVV. It is copied into place on provision.

For more information about Nginx and VVV, read the [Nginx Configs page](nginx-configs.md).

{% include always_reprovision.html %}
