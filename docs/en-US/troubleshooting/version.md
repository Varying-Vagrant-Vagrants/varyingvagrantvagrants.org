---
category: 5. Troubleshooting
order: 3
title: Versioning system used by VVV
description: How VVV project manage the various version and upgrades for the users
permalink: /docs/en-US/troubleshooting/versioning-system/
---

VVV projects is using the [semver](http://semver.org/) standard on defined and managing the various releases.


## What does it means
 
VVV is a suite of different tools that let you to manage different websites automatically with the various needs.  
Keep everything updated and aligned is not an easy task so to simplify the environment management the semver standard helps you and the contributors to the project.  
WordPress as example doesn't use the semver for their releases so every release can have different changes or backward compatibilities.
For any other kind of issues don't forget to check at [Troubleshooting page](https://varyingvagrantvagrants.org/docs/en-US/troubleshooting/).

### Major versions

With major version we are talking of 1.x.x or 2.x.x that in the VVV case require a `vagrant destroy` to download new virtual image and reinstall everything.  
Commands to run to update to this version:

    git pull # update to latest git version
    vagrant destroy # destroy or delete the VM image (not your files!)
    vagrant up # download the new VM image and reinstall everything with a provision
### Minor versions

With minor version we are talking of 1.1.x or 2.3.x that in the VVV case require only a `vagrant provision`.  
Commands to run to update to this version:
    git pull # update to latest git version
    vagrant up # launch the VM
    vagrant provision # updates everything inside the VM


