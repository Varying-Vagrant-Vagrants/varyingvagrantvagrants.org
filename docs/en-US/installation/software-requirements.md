---
category: 2. Getting Started
order: 1
title: Software Requirements
description: VVV requires recent versions of both Vagrant and VirtualBox to be installed, along with some vagrant plugins.
permalink: /docs/en-US/installation/software-requirements/
---

VVV requires recent versions of both Vagrant and VirtualBox to be installed, along with some vagrant plugins.

## Preparing Your Machine

If you aren't using a Mac, you may need to turn on virtualization in your computers BIOS, some computers have it turned off by default. On Intel machines this is called Intel VT-x, and AMD calls it AMD-V.

Refer to your machines manufacturer for how to access your BIOS. [This article may be helpful for enabling Intel VT-x](https://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/)

**Note**: If you have turned Hyper-V on, VirtualBox will not work

## Installing Vagrant and VirtualBox

1. Start with any local operating system such as Mac OS X, Linux, or Windows.
    * For Windows 8 or higher it is recommended that you run the cmd window as Administrator.
1. Install [VirtualBox 5.2+](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant 2.1+](https://www.vagrantup.com/downloads.html)
    * [Vagrant](https://www.vagrantup.com) is a "tool for building and distributing development environments". It works with [virtualization](https://en.wikipedia.org/wiki/X86_virtualization) software such as [VirtualBox](https://www.virtualbox.org/) to provide a virtual machine sandboxed from your local environment.
    * `vagrant` will now be available as a command in your terminal, try it out.
    * Provider support is included for VirtualBox, Parallels, Hyper-V, VMWare Fusion, and VMWare Workstation.
    * ***Note:*** If Vagrant is already installed, use `vagrant -v` to check the version. You may want to consider upgrading if a much older version is in use.

### Installing Vagrant Hosts Updater

The [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) plugin will modify your hosts file so that provisioned domains such as `http://vvv.test` works. To install it, run;

```
vagrant plugin install vagrant-hostsupdater
```

## Reboot

If you don't reboot your machine after installing/updating Vagrant and VirtualBox, there can be networking issues. A full power cycle will ensure all components are fully installed and loaded
