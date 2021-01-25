---
category: 5. Troubleshooting
order: 9
title: VirtualBox
description: Common VirtualBox issuees.
permalink: /docs/en-US/troubleshooting/virtualbox
---

## Updating to MacOS Big Sur or Newer

You need to update VirtualBox. Download the latest version of VirtualBox and install it.

## Apple Silicon

VirtualBox does not support Apple Silicon, you will need to find an alternative provider. We currently do not have hardware to test this, and there are no recommended providers. We may provide docker as a provider in the future, but there is no timeframe on this (unless we advertise that we support docker, the answer is no, it isn't ready/usable, help wanted!).

## VirtualBox Installer/Update Failing on MacOS

When installing VirtualBox, MacOS should present a security window asking if you want to allow the installation of kernel extensions. Sometimes this does not happen and the installer fails instead.

There are several solutions which work for different situations:

 - The security pane in System preferences
 - Restarting your computer
 - Clearing staged kernel extensions

After each of these, run the uninstaller if updating, and re-run the VirtualBox installer. Always use the latest version of VirtualBox that you can.

_Note:  Vagrant and VirtualBox are different pieces of software. You do not have to reinstall Vagrant or VVV to upgradee VirtualBox._

### The Security & Privacy Pane in System Preferences

After the installer fails, close the installer and head to the system preferences app. Then, open the Security & Privacy settings. There should be a message in that window about Oracle with an Allow button. Click this button, restart the machine, and run the VirtualBox installer again.

### Restarting your computer

Turning your Mac off and on again with a hard reboot can solve lots of problems related to VirtualBox installations.


### Clearing staged kernel extensions

Sometimes the installer can't add the necessary kernel extensions due to a prior failed install.

1. Uninstall VirtualBox with the uninstall tool found in the dmg
2. Restore SIP to default: `sudo csrutil clear`
3. Reboot
4. Clear staging: `sudo kextcache --clear-staging`
5. Reboot
6. Install VirtualBox and follow system prompt to allow Oracle

## Corrupted Virtual Machines

It's possible but rare that the Virtual Machine file system can become corrupted. This might happen if your VM didn't shut down correctly, perhaps there was a power cut or your laptop ran out of power unexpectedly.

In this scenario, your files should be safe on the host filesystem. If you have run `vagrant halt` recently, a database backup will be available. Using these, the site can be recovered from a fresh VVV box.

Follow the [starting from fresh](#starting-from-fresh) instructions at the top of this document to recover.

For more information on backups, see the [backups](#backups) section below.

### VirtualBox Cleanup Issues When Destroying and Recreating VVV

If your `vagrant up --provision` fails with an error like this:

```
VirtualBox error:

VBoxManage.exe: error: Could not rename the directory 'C:\Users\<username>\VirtualBox VMs\ubuntu-cloudimg-trusty-vagrant-amd64_1534242157844_99798' to 'C:\Users\<username>\VirtualBox VMs\localdev_306449ed646' to save the settings file (VERR_ALREADY_EXISTS)
VBoxManage.exe: error: Details: code E_FAIL (0x80004005), component SessionMachine, interface IMachine, callee IUnknown
VBoxManage.exe: error: Context: "SaveSettings()" at line 3111 of file VBoxManageModifyVM.cpp
```

Then the `vagrant destroy` command didn't manage to clean things up properly.

The default location for these files is:

 - Windows: `C:\Users\<username>\VirtualBox VMs`
 - Mac/*nix: `~/VirtualBox VMs`

Delete the folder name that matches the path in error above. In the example aboves case it would look **similar** to this:

    ....VirtualBox VMs\localdev_306449ed646\

Then go back and run `vagrant up --provision` again.
