---
category: 6. Reference
order: 2
title: WP-CLI
permalink: /docs/en-US/references/wp-cli/
---

VVV include the WP-CLI nightly version (updated during provisioning) but is possible to install the utilities to contribute to the project.

> WP-CLI is the command-line interface for WordPress. You can update plugins, configure multisite installations and much more, without using a web browser.

## About WP-CLI

[WP-CLI](https://wp-cli.org/) is the command-line interface for WordPress. You can update plugins, configure multisite installations and much more, without using a web browser.  
With this tool is possible to manage the websites installed, like changing the password of the users or export the database.

This tool is used inside VVV from the default provisioners and internals and is very powerful.

## Examples

```
wp db import ~/db-export.sql # VVV automatically generated database bbackups on halt
wp search-replace http://olddomain.com https://newdomain.com --export=newdb.sql --all-tables # Generate a dump with the url replaced
wp media regenerate # Regenerate all the thumbnails and the various images
wp post generate --count=10 # Create posts with dummy content
```

## Contribute to WP-CLI

VVV include an utility to install the official dev environment with all the various repo from [https://github.com/wp-cli/wp-cli-dev/](https://github.com/wp-cli/wp-cli-dev/).  
Also create a new alias to use this new instance `wp-dev` to run it.

Right now to use is required to enter with SSH to the machine with `vagrant ssh` and probably also to go to the website folder in `/srv/www/` that is the mounted point of the `www` folder of VVV.  
From the WP-CLI folder is possible to run the unit tests of the various commands:

![Unit test](https://user-images.githubusercontent.com/403283/66570851-b2c9a480-eb6e-11e9-8b8b-5242f687c07f.png)

```
composer behat # all the unit tests of a command
composer behat -- ./features/yourtest.feature # for a specific test
```

Anyway WP-CLI as an exhaustive [documentation](https://make.wordpress.org/cli/handbook/) also about [how to contribute](https://make.wordpress.org/cli/handbook/contributing/).

The best way for VVV is adding a new remote to the package repo that you want to patch, in this way is possible to use git also locally (outside the VM) and don't do any other commands.

## Resources
There are already a lot of guides about XHGui:

  * [What you can do with WP-CLI (talk)](http://mte90.tech/Talk-WPCLI/)
  * [Shell friends](https://make.wordpress.org/cli/handbook/shell-friends/)
