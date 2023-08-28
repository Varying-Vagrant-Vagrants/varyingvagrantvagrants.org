---
category: 5. Troubleshooting
order: 7
title: Migrating to Apple Silicon
description: Common issues and mistakes migrating to Apple Silicon.
permalink: /docs/en-US/troubleshooting/migrating-to-apple-silicon/
---

When using VVV on an Apple Silicon device there are a number of options:

 - Use the Parallels Pro/Business provider
   - Install a copy of Parallels Pro/Business
   - Install the `vagrant-parallels` plugin
 - Use the Docker provider
   - Requires VVV v3.13 or above, or the latest `develop` branch
   - Install Docker Desktop

**VirtualBox is not an option** and will not work on Apple Silicon, _especially when using the technical preview_.

If you have done this, VVV should turn on ok! Note that Docker support is experimental and may not fully match other providers.

If you copy your VVV install from an Intel Mac, there are some common mistakes you may not be aware of that will prevent VVV from running. Below is a list of known mistakes and their fixes.

## Common Intel to Apple Silicon Migration Mistakes

### Copying the VVV folder of an Intel machine with a `.vagrant` folder

Vagrant makes a subfolder named `.vagrant` with metadata about the Virtual Mmachine, and if you copy this from a Mac with VirtualBox it will try to look for that VM and error out that it can't find VirtualBox, _even if you asked for Parallels!_

To fix this, delete the `.vagrant` subfolder of your VVV install.

### Using VirtualBox Technical Preview

Oracle released a technical preview for VirtualBox on Apple Silicon, leading some to believe that VirtualBox could be used again. This release is a proof of concept and struggles to run 32bit Linux from the year 2000. It is years away from being usable in the modern Ubuntu distributions VVV depends upon.

Uninstall the technical preview and switch to Parallels/Docker.

### VirtualBox Vagrant plugins

If you have plugins such as `vagrant-disksize`, they will try to use VirtualBox even if it isn't present, leading to crashes. Uninstall these plugins and try again.

### Out of Date VVV

Only newer versions of VVV support Apple Silicon/Arm machines, upgrade to at least v3.7 or above.

### Customfiles and Shared Mounts Not Working on Parallels

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

**Remember, we do not provide support for customfiles, use them at your own risk!**
