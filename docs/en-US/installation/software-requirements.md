---
category: 2. Getting Started
order: 2
title: Software Requirements
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
1. Install [VirtualBox 5.x](https://www.virtualbox.org/wiki/Downloads) Note, currently 5.2.x fails on Ubuntu, use 5.1.x
1. Install [Vagrant 2.x](https://www.vagrantup.com/downloads.html)
    * [Vagrant](https://www.vagrantup.com) is a "tool for building and distributing development environments". It works with [virtualization](https://en.wikipedia.org/wiki/X86_virtualization) software such as [VirtualBox](https://www.virtualbox.org/) to provide a virtual machine sandboxed from your local environment.
    * `vagrant` will now be available as a command in your terminal, try it out.
    * Provider support is included for VirtualBox, Parallels, Hyper-V, VMWare Fusion, and VMWare Workstation.
    * ***Note:*** If Vagrant is already installed, use `vagrant -v` to check the version. You may want to consider upgrading if a much older version is in use.

### Installing Vagrant Plugins

Install these Vagrant plugins:
```
vagrant plugin install vagrant-hostsupdater vagrant-triggers vagrant-vbguest
```
 1. [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) plugin will set up your local `hosts` file so that provisioned domain names work
 1. [vagrant-triggers](https://github.com/emyl/vagrant-triggers) allows for various scripts to fire when issuing commands such as `vagrant halt` and `vagrant destroy`.
    * By default, if vagrant-triggers is installed, a `db_backup` script will run on halt, suspend, and destroy that backs up each database to a `dbname.sql` file in the `{vvv}/database/backups/` directory. These will then be imported automatically if starting from scratch. Custom scripts can be added to override this default behavior.
    * If vagrant-triggers is not installed, VVV will not provide automated database backups.
 1. [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)
    * Note: This step is not a requirement. When installed, it keeps the [VirtualBox Guest Additions](https://www.virtualbox.org/manual/ch04.html) kernel modules of your guest synchronized with the version of your host whenever you do `vagrant up`. This can prevent some subtle shared folder errors.

## Reboot

If you don't reboot your machine after installing/updating Vagrant and VirtualBox, there can be networking issues. A full power cycle will ensure all components are fully installed and loaded
