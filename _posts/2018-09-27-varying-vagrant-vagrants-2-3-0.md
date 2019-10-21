---
layout: default
title:  "Varying Vagrant Vagrants 2.3.0"
date:   2018-09-30 18:00:00 -0000
author: tomjn
---

Hi! Welcome to the release post for <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/releases/tag/2.3.0">Varying Vagrant Vagrants 2.3.0</a>. For help updating, see the documentation on [keeping VVV up to date](https://varyingvagrantvagrants.org/docs/en-US/installation/keeping-up-to-date/).

Here's what's happening...

## MailCatcher Replaced With MailHog

MailCatcher was proving difficult to support, and very fragile. In response, we've now replaced it with the superior MailHog. MailHog can be accessed via the dashboard at `vvv.test`

## Git LFS

Support was added for Git LFS type repositories, and has been tested with site templates. No additional steps are needed on the VVV side to support this.

## Improved Fallbacks

VVV will no longer continue to provision if packages installation or network detection fails. We've also changed our tests to use the Launchpad PPA servers rather than Google, enabling Chinese users to run VVV!

We also:

 - Improved the built in terminal prompt
 - Removed the MOTD instruction to manually update packages that broke VVV installs
 - Bundled the `apt-get` keys as some users failed to retrieve them for unknown reasons

## VVV searches 3 levels down for `vvv_hosts`

Instead of searching 4 levels down, VVV will search 3 folders down. There has also been performance improvements by explicitly searching for provisioner files where VVV expects them, and avoiding the search altogether.

Remember, `vvv_hosts` support, and being able to put provisioner files anywhere is included for legacy support reasons only. Nested VVV sites can be handled via the `vm_dir` and `local_dir` parameters without requiring slow filesystem searches.

## Logs

Logs are now owned by the `vagant` user not the `ubuntu` user, which should improve support for providers such as hyperV and others



## A Reminder, Uninstall Vagrant Triggers and  upgrade Vagrant to 2.1.5+

Since v2.2.x VVV now requires Vagrant 2.1 to run. The Vagrant triggers plugin is also no longer required, as it was merged into Vagrant 2.1.

Remember:

 - **VirtualBox** creates the VM
 - **Vagrant** manages the VM, turning it on and off, configuring it
 - **VVV** tels vagrant how to configure it, and how to install things

This does mean that users with the triggers plugin installed will get a warning when using vagrant commands. Read the warning for a parameter that can be added to silence the warning if you still need vagrant triggers for pre-2.1 vagrant environments. Otherwise, uninstall vagrant triggers with the following command:

```
vagrant plugin uninstall vagrant-triggers
```

We recommend a minimum of Vagrant 2.1.4, and suggest avoiding v2.1.3 which is known to be a broken Vagrant release.
