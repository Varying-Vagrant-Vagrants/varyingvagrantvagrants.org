---
category: 2. Getting Started
order: 3
title: Keeping Up To Date
permalink: /docs/en-US/installation/keeping-up-to-date/
---

Your VVV install will hopefully serve you many years, but in order to keep pace with new fixes and improvements, you'll need to update it from time to time.

## Updating VVV

Keep in mind that if you regularly update, `git pull; vagrant reload --provision` should do just fine.

## Thoroughly Updating VVV

But if you want to be thorough, follow these steps:

 1. `vagrant halt`
 2. Make sure your vagrant and virtualbox are up to date. If necessary, download a new vagrant, use the uninstall tool and install a fresh copy.
 3. Run `vagrant box update` ( optional but probably for the best ).
 4. `git pull` if you used git to install VVV
    1.  if you downloaded VVV as a zip, download and extract a new copy of VVV over the top. Make sure that your existing sites in `www` aren't overwritten, and you have DB backups.
    2. If you used `git` you should be fine, as long as you had `vagrant triggers`
 5. Now your copy of VVV is up to date.
 6. Run `vagrant up --provision` to update the box and bring it up.

### A Note On Preserving Data

VVV is intended as a developer environment, and you should be able to throw away the VM and rebuild it without loosing anything. Having said that, do not keep critical information stored only in VVV, always take backups.

For most users, halting the VM, fetching the latest version, then provisioning is perfectly safe.

If for whatever reason the VVV VM is lost, VVV will attempt to restore from its own backups made via `vagrant-triggers`, but you should not rely on this ( and you shouldn't modify these backups either else data loss can occur on provisioning ).

