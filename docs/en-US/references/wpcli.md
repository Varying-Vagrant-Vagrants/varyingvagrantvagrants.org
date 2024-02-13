---
category: 6. Reference
order: 2
title: WP-CLI
permalink: /docs/en-US/references/wp-cli/
---

[WP-CLI](https://wp-cli.org/) is the command-line interface for WordPress. You can update plugins, configure multisite installations and much more, without using a web browser.

With this tool it is possible to manage the websites installed, like changing the password of users or exporting the database. This tool is used inside VVV from the default provisioners and internals and is very powerful.

VVV includes the nightly version of WP-CLI, but if you want to contribute to WP CLI development, you can install the `wpcli-dev` extension.

## Examples

For example, these commands ran inside of VVV in a site folder could be used to import a database from a `db-export.sql` file:
```sh
wp db import ~/db-export.sql # VVV automatically generated database backups on halt
wp search-replace http://olddomain.com https://newdomain.com --export=newdb.sql --all-tables # Generate a dump with the url replaced
```

Or to regenerate intermediate images in the uploads folder:

```sh
wp media regenerate # Regenerate all the thumbnails and the various images
```

Or generate random dummy content:

```sh
wp post generate --count=10 # Create posts with dummy content
```


## Using WP-CLI inside VVV

To run WP CLI inside VVV, first use `vagrant ssh`. This will put you inside the Ubuntu container/virtual machine. WP CLI should now be available, but you'll need to switch to the folder that contains the site you want to run commands on.

To run WP-CLI commands on a specific site, change directory to that site, e.g. for the `wordpress-one` site:

 ```sh
 cd /srv/www/wordpress-one/public_html
 ```
Now you can use `wp`.

## Contributing to WP-CLI

VVV includes a extension to install the official dev environment with all the various repositories from [https://github.com/wp-cli/wp-cli-dev/](https://github.com/wp-cli/wp-cli-dev/). To use this new instance replace `wp` with `wp-dev`.

To use this, SSH into the virtual machine with `vagrant ssh`.

From the WP-CLI dev folder it is possible to run the unit tests of the various commands:

![Unit test](https://user-images.githubusercontent.com/403283/66570851-b2c9a480-eb6e-11e9-8b8b-5242f687c07f.png)

```sh
composer behat # all the unit tests of a command
composer behat -- ./features/yourtest.feature # for a specific test
```

WP-CLI has exhaustive [documentation](https://make.wordpress.org/cli/handbook/) on how to utilize and on [how to contribute](https://make.wordpress.org/cli/handbook/contributing/).

We recommend adding a new git remote to the repository, so that you can push changes to GitHub for pull requests.

## Further Reading

There are already a lot of guides about WP CLI:

  * [What you can do with WP-CLI (talk)](http://mte90.tech/Talk-WPCLI/)
  * [Shell friends](https://make.wordpress.org/cli/handbook/shell-friends/)
