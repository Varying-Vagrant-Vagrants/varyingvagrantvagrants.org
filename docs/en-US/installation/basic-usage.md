---
category: 2. Getting Started
order: 2
title: Basic Usage
description: VVV assumes some very basic terminal/command line knowledge but Vagrant Manager allows your to manage Vagrant with a visual UI.
permalink: /docs/en-US/references/basic-usage/
---

## Turning VVV On

[Change into the VVV folder](#changing-into-the-vvv-folder) and run:

```sh
vagrant up
```

If you have never turned VVV on before, expect to wait a short period while it installs PHP and other tools.

You may be asked for an admin password at the beginning. This will be your computers administrative password or the password used for `sudo`.

## Turning VVV Off

[Change into the VVV folder](#changing-into-the-vvv-folder) and run:

```sh
vagrant halt
```

This will shut down the virtual machine. If the machine is frozen for whatever reason, add the ` --force` parameter. If it still refuses to power off, open VirtualBox and manually power the VM off.

You may be asked for an admin password to remove hosts.

## Restarting VVV

[Change into the VVV folder](#changing-into-the-vvv-folder) and run:

```sh
vagrant reload
```

This will do a restart of the Virtual Machine, and is the same as running `vagrant halt` followed by `vagrant up`.

## Running Commands Inside VVV

Turn VVV on then [change into the VVV folder](#changing-into-the-vvv-folder) and run:

```shell
vagrant ssh
```

Now you are inside VVV, and in an Ubuntu shell. You can use all the commands VVV uses such as `npm` or `node`. You will find your `www` folder with all your sites at `/srv/www`. When you are done, use the `exit` command to return to your host machine.

## Applying Updates and `config/config.yml` Changes

If you update VVV or change the `config.yml` file, you must re-provision to apply the changes. To do this, [change into the VVV folder](#changing-into-the-vvv-folder) run:

```sh
vagrant up --provision
```

If you ever have problems with VVV, re-provision again, and if there is still a problem, send the full output to us on Github or Slack.

## Changing Into The VVV Folder

To run commands, you need to open a terminal and change into the VVV folder. Open a terminal or if you are on Windows and elevated/admin command prompt then change into the VVV folder like this:

Linux/MacOS:
```sh
cd ~/vvv-local
```

Windows elevated/admin command prompt:
```powershell
cd %systemdrive%%homepath%/vvv-local
```

Older instructions used `vagrant-local` instead of `vvv-local`. If you installed VVV to `vagrant-local` or another location, swap `vvv-local` for your preferred location.


## Using a GUI

This documentation assumes some very basic terminal/command line knowledge to run simple commands. However, some people prefer the convenience of a visual UI. If you fall into this category then consider the [Vagrant Manager](http://vagrantmanager.com/) project.

Note: Until you provision VVV for the first time, Vagrant Manager will not pick up VVV. Running `vagrant up --provision`  inside the VVV folder and allowing it to successfully finish should be enough.
