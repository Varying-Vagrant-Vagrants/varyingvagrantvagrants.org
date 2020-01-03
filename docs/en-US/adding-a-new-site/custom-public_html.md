---
category: 3. Adding a New Site
order: 3
title: Custom public_html web roots
description: How to change the folder that gets served to the web
permalink: /docs/en-US/adding-a-new-site/custom-public_html/
---

The default site provisioners will generate a `public_html` sub folder that acts as the sites webroot. This is different from custom paths and folders, as move the entire site, including error logs, provisioners, etc.

You can also change the public webroot to another folder. You might do this because the server you're replicating uses `htdocs` instead of `public_html`.


## How It Gets Set

This is set in the Nginx config file in `provision/vvv-nginx.conf`, check the [dedicated page](https://varyingvagrantvagrants.org/docs/en-US/adding-a-new-site/custom-nginx/).

**Once you've done this, reprovision for the change to take effect.**

### Troubleshooting Sites Using The Custom Site Templates

When using the custom site template, the Nginx config is generated on provision from a template. If you modify the config it'll be replaced on the next provision. So make sure you modify the template `vvv-nginx.conf.tmpl`, not the generated config.
