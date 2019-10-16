---
category: 5. Troubleshooting
order: 1
title: Troubleshooting
description: Find help on GitHub and the wiki or check how to resolve common problems.
permalink: /docs/en-US/troubleshooting/
---

Need help? **Let us know on GitHub! Don't hesitate to open a [new issue on GitHub](https://github.com/Varying-Vagrant-Vagrants/VVV/issues)** if you run into trouble or have any tips that we need to know. There's no need to spend hours trying to fix a local install when a VVV contributor can point you in the right direction

## Starting from Fresh

Sometimes a clean, fresh start fixes things.

> Note: before doing this you should review the [News &amp; Changelog](/blog/) blog. Sometimes you will also need to update the underlying software such as Vagrant or its plugins in order for this process to be successful.

To do a fresh start, run the following commands:

```shell
# If you need a fresh start it's probably sensible to make sure you are on the stable branch
git checkout master
# Make sure this is the latest VVV
git pull
# Turn the machine on (so destroy can run its cleanup)
vagrant up
# Destroy the machine
vagrant destroy
# Make sure we use the latest version of the base box
vagrant box update
# Make sure the recommended vagrant plugins are installed
vagrant plugin install vagrant-hostsupdater
# And that they're all up to date
vagrant plugin update
# Start VVV and create the VM from scratch
vagrant up --provision
```

If your `vagrant up --provision` fails with an error like this:

```
VirtualBox error:

VBoxManage.exe: error: Could not rename the directory 'C:\Users\<username>\VirtualBox VMs\ubuntu-cloudimg-trusty-vagrant-amd64_1534242157844_99798' to 'C:\Users\<username>\VirtualBox VMs\localdev_306449ed646' to save the settings file (VERR_ALREADY_EXISTS)
VBoxManage.exe: error: Details: code E_FAIL (0x80004005), component SessionMachine, interface IMachine, callee IUnknown
VBoxManage.exe: error: Context: "SaveSettings()" at line 3111 of file VBoxManageModifyVM.cpp
```

Then the `vagrant destroy` command didn't manage to clean things up properly.

The default location for these files is:

    C:\Users\<username>\VirtualBox VMs

Delete the folder name that matches the path in error above. In the example aboves case it would look **similar** to this:

    C:\Users\<username>\VirtualBox VMs\localdev_306449ed646\

Then go back and run `vagrant up --provision` again.

## Common Problems

### VirtualBox Failing to Install on MacOS the first time around

On recent versions of MacOS, you need to go into the system preferences to the security panel. Here it will be complaining that an unverified piece of software from Oracle named VirtualBox tried to install things. Unlock the settings pane and approve this, then re-run the installer and all should be fine.

For whatever reason, MacOS doesn't pop up the usual dialog notifying you when the VirtualBox installer attempts this for the first time, and the VirtualBox installer doesn't tell you what to do.

### SSH Timeout During Provision

This is a generic error that can indicate multiple things, including:

 - An unexpected error in the provisioner
 - Failure to set up the connection between Vagrant and the running VM ( a handful of versions of Vagrant failed to install the necessary keys inside the VM, updating Vagrant, destroying the box, and doing a clean provision should resolve this )
 - Local network IP clashes
 - Firewalls
 - Unusual network configurations
 - Many other possible problems

If this happens, do the following, and provide the results when asking for help.

 - Run `vagrant ssh`, if this works and you're able to get inside the VVV machine and run commands that is useful information, and may allow you to manually run the commands to bring up nginx and PHP
 - Halt the machine with `vagrant halt` and turn it back on in debugging mode using `
 vagrant up --provision --debug > vagrant.log`. The log file may then reveal errors that might not show in the terminal. Send this file when reporting problems.

### Vagrant Plugin Install Issues and Broken Vagrant Upgrades

When updating from Vagrant 1.x to 2.x, Vagrants bundler can throw errors, here's an example:

```shell
$ vagrant plugin install vagrant-hostsupdater
Installing the 'vagrant-hostsupdater' plugin. This can take a few minutes...
Bundler, the underlying system Vagrant uses to install plugins,
reported an error. The error is shown below. These errors are usually
caused by misconfigured plugin installations or transient network
issues. The error from Bundler is:

conflicting dependencies ffi (= 1.9.18) and ffi (= 1.9.14)
  Activated ffi-1.9.14
  which does not match conflicting dependency (= 1.9.18)

  Conflicting dependency chains:
    ffi (= 1.9.14), 1.9.14 activated

  versus:
    ffi (= 1.9.18)

  Gems matching ffi (= 1.9.18):
    ffi-1.9.18-x64-mingw32
 ```

When this happens, the solution is to completely uninstall Vagrant, then reinstall. Do this either using the uninstall tool in the DMG on MacOS, or the standard uninstaller on Windows.

## Corrupt VM

It's possible that the Virtual Machine file system may become corrupted. This might happen if your VM didn't shut down correctly, perhaps there was a power cut or your laptop ran out of power unexpectedly.

In this scenario, your files should be safe on the host filesystem. If you have run `vagrant halt` recently, a database backup will be available. Using these, the site can be recovered from a fresh VVV box.

Follow the [starting from fresh](#starting-from-fresh) instructions at the top of this document to recover.

For more information on backups, see the [backups](#backups) section below.


## Common Causes of Problems

### Typos in your config file

If there's a typo or syntax error in `vvv-custom.yml` the provisioner will fail. Make sure the file is valid YAML when making changes to this file.

### Out of Date VVV

VVV is an active project, but if it isn't up to date you might suffer from bugs that have already been fixed.

Updating is often as simple as doing a `git pull` and restarting/reprovisioning VVV with `vagrant reload --provision`. However, occasionally a new version of VVV may require the underlying software to be updated first, so it is wise to check the [News &amp; Changelog](/blog/) before doing this.

If you downloaded a zip originally, you can [convert your install to use git](../installation/converting-zip-install-to-git.md) and then perform the update process above.

### Out of Date Software

Mismatched Virtualbox and Guest additions can cause problems, as can older versions of Vagrant. When troubleshooting a problem, update to the latest versions of software, then verify the problem still exists after a `vagrant halt; vagrant up --provision`

### Local Network IP Clashes

The network configuration picks an IP of 192.168.50.4. It could cause conflicts on your existing network if you *are* on a 192.168.50.x subnet already. You can configure any IP address in the `Vagrantfile` and it will be used on the next `vagrant up --provision`

### Vagrant and VirtualBox

VVV relies on the stability of both Vagrant and VirtualBox. These caveats are common to Vagrant environments and are worth noting:
* If the directory VVV is inside of is moved once provisioned (`vagrant-local`), it may break.
    * If `vagrant destroy` is used before moving, this should be fine.
* If VirtualBox is uninstalled, VVV will break.
* If Vagrant is uninstalled, VVV will break.

### Memory Allotment

The default memory allotment for the VVV virtual machine is 2048MB. If you would like to raise or lower this value to better match your system requirements, a [you can do so with the vm_config section of `vvv-custom.yml`](../vm_config.md) is in the wiki.

### 64bit Ubuntu and Older CPUs

Since version 1.2.0, VVV has used a 64bit version of Ubuntu. Some older CPUs (such as the popular *Intel Core 2 Duo* series) do not support this. Changing the line `config.vm.box = "ubuntu/trusty64"` to `"ubuntu/trusty32"` in the `Vagrantfile` before `vagrant up` will provision a 32bit version of Ubuntu that will work on older hardware.

### Strange letters (like accented) in Windows user name

It is a [bug confirmed in Vagrant](https://github.com/hashicorp/vagrant/issues/2113#issuecomment-480650634) but there is a workaround in the original bug report.

## Backups

In the event that you're stuck or at a loss, VVV tries to generate database backups at `VVV/database/backups/*.sql`, with a file for each database.

This coupled with the uploads in the file system should allow the VVV environment to be recreated from a clean slate.
