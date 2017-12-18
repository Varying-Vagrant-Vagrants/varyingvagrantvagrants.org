---
layout: default
title:  "Varying Vagrant Vagrants 2.1.0"
date:   2017-11-08 17:00:00 -0000
author: jeremyfelt
---

Hi! Welcome to the release post for <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/releases/tag/2.1.0">Varying Vagrant Vagrants 2.1.0</a>. For help updating, see the documentation on [keeping VVV up to date](https://varyingvagrantvagrants.org/docs/en-US/installation/keeping-up-to-date/).

Here's what's happening...

## A new TLD for default sites

The `.test` TLD is now used for all default VVV sites instead of `.dev`.

You may have noticed back in September that Google added their `.dev` TLD [to the HTTPS preload list](https://chromium-review.googlesource.com/c/chromium/src/+/669923) in Google Chrome. This means that in recent versions of Chrome `.dev` domains are forced to use HTTPS.

Up until this point, VVV relied heavily on the `.dev` TLD and moving to a TLD that isn't owned by anyone is a pretty obvious move. After quite a bit of [discussion](https://github.com/Varying-Vagrant-Vagrants/VVV/issues/583), we determined that `.test` was the best of the options laid out in [RFC2606](https://tools.ietf.org/html/rfc2606).

Because we can't detect all customizations made to default sites, automatically updating everything isn't an option. Default sites like `src.wordpress-develop.dev` will still work at their current URLs and will require a bit of manual effort to move over to `src.wordpress-develop.test`.

With WP-CLI, it's pretty straight forward:

* `vagrant ssh`
* `cd /srv/www/wordpress-develop/public_html`
* `wp search-replace '.dev' '.test' --recurse-objects --network`

On new provisions of VVV, this will all be setup automatically. On your own custom sites, you'll need to adjust accordingly. Embrace the `.test` domain!

**Update:** We've added [more extensive instructions for migrating from `.dev` to `.test` here](https://varyingvagrantvagrants.org/docs/en-US/troubleshooting/dev-tld/)

Thanks to [Gary](https://github.com/pento) for [warning us](https://github.com/Varying-Vagrant-Vagrants/VVV/issues/583) about this 2.5 years ago. :)

## Better and better documentation

Many updates to VVV's documentation on [varyingvagrantvagrants.org](https://varyingvagrantvagrants.org/) were made between the release of 2.0.0 and now.

The process to contributing to documentation has changed to use the [varyingvagrantvagrants.org](https://github.com/Varying-Vagrant-Vagrants/varyingvagrantvagrants.org) repository. This clears the workflow for shipping documentation changes to proceed separately from shipping VVV releases.

There has also been a **great** improvement in the quality and presentation of the documentation. Things look great, are navigable, and you can search!

As a bonus, check out all the excellent work that's been done on the VVV dashboard at your local [http://vvv.test](http://vvv.test) site.

![A screenshot of the new dashboard used in VVV 2.1.0]({{ "/images/vvv-dash-2.1.0.png" | absolute_url }})

## And more

A [full changelog](https://varyingvagrantvagrants.org/docs/en-US/changelog/) is up that has all of the details for this release. We fixed MailCatcher, made some tweaks to how PHPCS is installed and its configuration, and applied some small adjustments to the VM configuration.

## Project notes

Wayyyyyy back in April, we added [Tom J Nowell](https://github.com/tomjn) as a VVV committer and he's been doing a fantastic job of staying on top of things. He's been a prolific contributor this year, much of the current state of our documentation structure is due to his work, and he made our excellent logo!

## Future thoughts

There's always a lot to think about for the future of VVV, but I'll note a couple things that are coming up:

* At some point we'll want to move to the latest Ubuntu LTS release. This will be a breaking change and require a 3.x.x.
* We may also take this opportunity to refactor how provisioning is done and instead provide our own base box.
* Have more ideas? Come on over and [participate](https://github.com/Varying-Vagrant-Vagrants/VVV)!

That's all for 2.1.0. A big thank you to every one of our <a href="https://github.com/Varying-Vagrant-Vagrants/VVV#varying-vagrant-vagrants">contributors</a> and thank you for using VVV!
