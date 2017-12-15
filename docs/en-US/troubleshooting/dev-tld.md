---
category: 4. Troubleshooting
order: 2
title: .dev domains
description: Issues with .dev sites
permalink: /docs/en-US/troubleshooting/dev-tld
---

A lot of people use the `.dev` domain for local development, but this TLD is actually owned by Google, and isn't free for development. They've begun enforcing special rules on sites using this domain when using Chrome. You also run the risk of clashes with Google owned domains.

The fix is simple, switch to `.test`, here, you'll find instructions on converting existing sites over. For this reason, the dashboard supports `http://vvv.test`

## Why not about `.local` or `.localhost`?

`.test`, `.local`, and `.localhost` are all protected by RFCs and can't be bought as `.dev` was by Google. However, they have strings attached.

`.local` is used by zeroconf and bonjour to make computers on a local network easier to use. For example, if I name my machine `vvv`, other computers can reach it at `vvv.local`. This would break VVV's dashboard however.

`.localhost` does not have this issue, but the RFC forces it to the local loopback. This means you could never share the site with other computers on the same network for testing.

`.test` is protected by an RFC but the RFC does not place any restrictions on how it's intended to be used.

## How To Migrate to `.test`

### Change The Hosts VVV uses

Modify your VVV config in `vvv-custom.yml` by replacing the hosts for each site with `.test` versions. Once this is done, reprovision using `vagrant reload --provision` for the change to take effect.

This will make VVV serve the site at the correct domain, and update the dashboard site list

#### Custom Provisioners

If you've forked the custom site template, or modified the nginx/provisioner scripts, you should check these to make sure it doesn't install or try to serve `.dev` in the future.

### Search Replace

WordPress will have been installed with `.dev` in the site URL, so you need to use WP CLI to do a [search replace](https://developer.wordpress.org/cli/commands/search-replace/).

1. SSH into VVV using `vagrant ssh`
2.  `cd` into the `/srv/www` folder, then `cd` into the subfolder with your site. This should be the same as your `www` folder.
3. Enter the `public_html` subfolder so that we can use WP CLI
4. Run `wp search-replace '.dev' '.test'`

If you've hardcoded the `.dev` domain in your plugins or themes, or `wp-config.php`, those will need manually changing

#### Example: Search Replacing `local.wordpress.dev` to `local.wordpress.test`

These are the commands that would change the default site over from `.dev` to `.test`:

 - `vagrant ssh`
 - `cd /srv/www`
 - `cd wordpress-default/public_html`
 - `wp search-replace '.dev' '.test'`

## Migrating from `.local`

The steps are identical to those for `.dev`, except, the search replace command swaps `.dev` for `.local`:

```
wp search-replace '.dev' '.test'
```