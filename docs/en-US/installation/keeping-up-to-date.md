---
category: 2. Getting Started
order: 3
title: Keeping Up To Date
description: Update VVV from time to time to keep pace with new fixes and improvements.
permalink: /docs/en-US/installation/keeping-up-to-date/
---

Your VVV install will hopefully serve you for many years, but in order to keep pace with new fixes and improvements, you'll need to update it from time to time.

## What is the Semantic Versioning standard and how VVV used it

The VVV project uses the [semver](http://semver.org/) system for versioning because is a suite of different tools that let you to manage different websites automatically with the various needs.  
Keep everything updated and aligned is not an easy task so to simplify the environment management the semver standard helps you and the contributors to the project.  
WordPress as example doesn't use the semver for their releases so every release can have different changes or backward compatibilities.
For any other issues don't forget to check the [troubleshooting page](https://varyingvagrantvagrants.org/docs/en-US/troubleshooting/).
This versioning is used only for VVV and for the various repo is based this suite!

### Major versions

With major version we are talking of 1.x.x or 2.x.x that in the VVV case require a `vagrant destroy` to download new virtual image and reinstall everything.  
Commands to run to update to this version:

    git pull # update to latest git version
    vagrant destroy # destroy or delete the VM image (not your files!)
    vagrant up # download the new VM image and reinstall everything with a provision

Also critical bugfixes are released as major releases!

### Minor versions

With minor version we are talking of 1.1.x or 2.3.x that in the VVV case require only a `vagrant provision`.  
Commands to run to update to this version:
    git pull # update to latest git version
    vagrant up # launch the VM
    vagrant provision # updates everything inside the VM

## Updating VVV

Keep in mind that if you regularly update, `git pull; vagrant reload --provision` should do just fine.

## Thoroughly Updating VVV

But if you want to be thorough, follow these steps:

 1. `vagrant halt`
 2. Make sure your vagrant and virtualbox are up to date. If necessary, download a new vagrant, use the uninstall tool and install a fresh copy.
 3. Run `vagrant box update` ( optional but probably for the best ).
 4. `git pull` if you used git to install VVV.
    1.  if you downloaded VVV as a zip, download and extract a new copy of VVV over the top. Make sure that your existing sites in `www` aren't overwritten, and you have DB backups.
    2. If you used `git` you should be fine
 5. Now your copy of VVV is up to date.
 6. Run `vagrant up --provision` to update the box and bring it up.

### A Note On Preserving Data

VVV is intended as a developer environment, and you should be able to throw away the VM and rebuild it without losing anything. Having said that, do not keep critical information stored only in VVV, always take backups.

For most users, halting the VM, fetching the latest version, then provisioning is perfectly safe.

If for whatever reason the VVV VM is lost, VVV will attempt to restore from its own backups made, but you should not rely on this ( and you shouldn't modify these backups either else data loss can occur on provisioning ).
