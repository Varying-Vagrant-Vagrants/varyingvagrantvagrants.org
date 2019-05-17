---
category: 6. Reference
order: 2
title: Updating WordPress
permalink: /docs/en-US/references/updating-wp/
---

VVV will automatically update WordPress on a reprovision if you're using the custom site templates, but there are other methods of updating.

### custom-site-template

As well as reprovisioning, all the normal methods for updating work too, e.g.:

 - Downloading WordPress from WordPress.org and extracting the zip file into `public_html`
 - Using the built in updater in the Admin area
 - Using WP CLI's core updater command

### custom-site-template-develop

#### Using SVN

Navigate to the `public_html` folder of the site in a terminal/command prompt, and run `svn up`.

#### Using Git

Navigate to the `public_html` folder of the site, and run `git pull`. This will happen automatically on reprovision, but only if you're using the default `master` branch.

## Manual WP Installs

Manual installs won't be updated on provision unless a `vvv-init.sh` script has been written to do this. These installs will need to be updated manually, either via WP Admin, WP CLI, or by downloading WordPress.
