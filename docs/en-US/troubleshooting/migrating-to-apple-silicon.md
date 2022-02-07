---
category: 5. Troubleshooting
order: 7
title: Migrating to Apple Silicon
description: Common issues and mistakes migrating to Apple Silicon.
permalink: /docs/en-US/troubleshooting/migrating-to-apple-silicon/
---

When using VVV on an Apple Silicon device there are a number of steps to take:

 - Install a copy of Parallels Pro/Business
 - Install the `vagrant-parallels` plugin

If you have done this, VVV should turn on ok! In the future Docker may be a viable alternative but this is in the prototype stages.

If you copy your VVV install from an Intel Mac, there are some common mistakes you may not be aware of that will prevent VVV from running. Below is a list of known mistakes and their fixes.

## Common Intel to Apple Silicon Migration Mistakes

### Copying the VVV folder of an Intel machine with a `.vagrant` folder

Vagrant makes a subfolder named `.vagrant` with metadata about the Virtual Mmachine, and if you copy this from a Mac with VirtualBox it will try to look for that VM and error out that it can't find VirtualBox, _even if you asked for Parallels!_

To fix this, delete the `.vagrant` subfolder of your VVV install.

### VirtualBox Vagrant plugins

If you have plugins such as `vagrant-disksize`, they will try to use VirtualBox. Uninstall these plugins and try again.

### Out of Date VVV

Only newer versions of VVV support Apple Silicon/Arm machines, upgrade to at least v3.7 or above.

### Customfiles and Shared Mounts

You may encounter errors such as this if you use a customfile to add additional shared folders:

```
Failed to mount folders in Linux guest. You’ve specified mount options which are not supported by “prl_fs” file system.

Invalid mount options: [“dmode=775", “fmode=774”]
```

This is because your shared mounts are configured for VirtualBox and no Parallels overrides are available.

To fix this, provide an override for the parallels provider, e.g.

```ruby
# virtualbox
config.vm.synced_folder "foobar", "/srv/foobar", owner: "vagrant", group: "www-data", create: true, mount_options: [ "dmode=775", "fmode=774" ]

# parallels
config.vm.provider :parallels do |_v, override|
  override.vm.synced_folder "foobar", "/srv/foobar", owner: "vagrant", group: "www-data", create: true, mount_options: [ "share" ]
end
```

Remember, we do not provide support for customfiles, use them at your own risk!
