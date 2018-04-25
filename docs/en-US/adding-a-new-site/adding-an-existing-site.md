---
category: 3. Adding a New Site
order: 5
title: Adding an Existing Site
description: VVV needs to know a few things before you can hand it an existing site.
permalink: /docs/en-US/adding-a-new-site/adding-an-existing-site/
---

You might be tempted to throw your existing WordPress install in a folder and add a site like this:

```yaml
sites:
  mysite:
    hosts:
      - mysite.test
```

Only to find that mysite.test leads to the VVV dashboard, what's going on?

## Provisioner Files and Site Templates

VVV needs to know what to do with a site in order to provision it, this includes:

 - a script to create the database and install WordPress
 - an Nginx config so that VVV knows how to serve the site

These files are all provided by a site template. It's strongly recommended that you use the custom site template to start your site, then once it's provisioned, copy over your existing site.

Alternatively, you can fork the official site templates or copy their `provision` folder, and place your own site in the `public_html` subfolder. This has the same effect as provisioning with the official site templates, but prevents future updates and fixes being applied.

For more information, see the site templates section
