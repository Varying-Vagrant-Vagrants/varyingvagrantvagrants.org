---
category: 2. Getting Started
order: 2
title: Software Requirements
permalink: /docs/en-US/installation/software-requirements/
---

VVV requires recent versions of both Vagrant and VirtualBox to be installed, along with some vagrant plugins.

1. Start with any local operating system such as Mac OS X, Linux, or Windows.
    * For Windows 8 or higher it is recommended that you run the cmd window as Administrator
1. Install [VirtualBox 5.x](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant 1.x](https://www.vagrantup.com/downloads.html)
    * [Vagrant](https://www.vagrantup.com) is a "tool for building and distributing development environments". It works with [virtualization](https://en.wikipedia.org/wiki/X86_virtualization) software such as [VirtualBox](https://www.virtualbox.org/) to provide a virtual machine sandboxed from your local environment.
    * `vagrant` will now be available as a command in your terminal, try it out.
    * Provider support is included for VirtualBox, Parallels, Hyper-V, VMWare Fusion, and VMWare Workstation.
    * ***Note:*** If Vagrant is already installed, use `vagrant -v` to check the version. You may want to consider upgrading if a much older version is in use.
1. Install some these Vagrant plugins:
    1. Install the [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) plugin with `vagrant plugin install vagrant-hostsupdater`
        * Note: This step is not a requirement, though it does make the process of starting up a virtual machine nicer by automating the entries needed in your local machine's `hosts` file to access the provisioned VVV domains in your browser.
        * If you choose not to install this plugin, a manual entry should be added to your local `hosts` file that looks like this: `192.168.50.4  vvv.test local.wordpress.test src.wordpress-develop.test build.wordpress-develop.test`
    1. Install the [vagrant-triggers](https://github.com/emyl/vagrant-triggers) plugin with `vagrant plugin install vagrant-triggers`
        * Note: This step is not a requirement. When installed, it allows for various scripts to fire when issuing commands such as `vagrant halt` and `vagrant destroy`.
        * By default, if vagrant-triggers is installed, a `db_backup` script will run on halt, suspend, and destroy that backs up each database to a `dbname.sql` file in the `{vvv}/database/backups/` directory. These will then be imported automatically if starting from scratch. Custom scripts can be added to override this default behavior.
        * If vagrant-triggers is not installed, VVV will not provide automated database backups.
    1. Install the [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) plugin with `vagrant plugin install vagrant-vbguest`.
        * Note: This step is not a requirement. When installed, it keeps the [VirtualBox Guest Additions](https://www.virtualbox.org/manual/ch04.html) kernel modules of your guest synchronized with the version of your host whenever you do `vagrant up`. This can prevent some subtle shared folder errors.
