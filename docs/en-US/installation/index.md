---
category: 2. Getting Started
order: 2
title: Installation
description: VVV can be installed with git by cloning the main VVV repo into a local directory or by downloading a zip file. Start VVV with 'vagrant up'.
permalink: /docs/en-US/installation/
---

First make sure you have all the necessary software installed for Vagrant to run listed in the [software requirements](software-requirements.md) section.

## Installing VVV

There are 2 methods to getting VVV, but we recommend using `git` as it makes updating much easier

### With `git`

**This is the recommended method** for installing VVV. Clone the main VVV repo into a local directory:

```
git clone -b stable git://github.com/Varying-Vagrant-Vagrants/VVV.git ~/vagrant-local
```

Alternatively, for faster updates and bleeding edge features, or if you want to help test the next version, use the `develop` branch instead of the `stable` branch.

### Without `git`

There are 2 methods, both involve downloading a zip file:

  * download and extract the repository `develop` branch [zip file](https://github.com/varying-vagrant-vagrants/vvv/archive/develop.zip) to a `vagrant-local` directory on your computer.
  * OR download and extract a [stable release](https://github.com/varying-vagrant-vagrants/vvv/releases) zip file if you'd like some extra comfort.

**Note:** We strongly recommend using the `git` method, it makes updating VVV to get new features and fixes significantly easier.

## Making Configuration Changes Before Starting For The First Time

This step is optional.

If you need to modify the config file before starting VVV for the first time, you can run `vagrant status` in the VVV folder, and VVV will create `config/config.yml` for you by copying the default config at `config/default-config.yml`. Modify and save `config/config.yml` with any adjustments you might want then proceed to start VVV. Remember, if you ever need to change this file, you need to reprovision to apply the changes.

You might do this in order to change the provider vagrant uses to Hyper-V instead of VirtualBox, or to provision additional sites the first time the VM is created to save time.

## Starting VVV

1. In a terminal, or an administrator command prompt, change into the new directory with `cd vagrant-local`.
1. Start the Vagrant environment with `vagrant up`.
    * Windows users must use a command prompt started with administrator priviledges. If you do not do this you won't get custom host names, and `vvv.test` will not resolve in a browser
    * Be patient as the magic happens. This could take a while on the first run as your local machine downloads the required files.
    * Watch as the script ends, as an administrator or `su` ***password may be required*** to properly modify the hosts file on your local machine. You will know it's completed when you see the VVV logo and the teddy bear artwork.
1. Visit [the VVV Dashboard at http://vvv.test](http://vvv.test) to view your new WordPress sites.

## What Did That Do?

The first time you run `vagrant up`, a packaged box containing a basic virtual machine is downloaded to your local machine and cached for future use. The file used by Varying Vagrant Vagrants contains an installation of Ubuntu 18.04.

After this box is downloaded, it begins to boot as a sandboxed virtual machine using VirtualBox. Once booted, it runs the provisioning script included with VVV. This initiates the download and installation of around 150MB of packages on the new virtual machine.

The time for all of this to happen depends a lot on the speed of your Internet connection. If you are on a fast cable connection, it will likely only take several minutes.

On future runs of `vagrant up`, the packaged box will be cached on your local machine and Vagrant will only need to apply the requested provisioning.

* ***Preferred:*** If the virtual machine has been powered off with `vagrant halt`, `vagrant up` will quickly power on the machine without provisioning.
* ***Rare:*** If you would like to reapply the provisioning scripts with `vagrant up --provision` or `vagrant provision`, some time will be taken to check for updates and packages that have not been installed.
* ***Very Rare:*** If the virtual machine has been destroyed with `vagrant destroy`, it will need to download the full 100MB of package data on the next `vagrant up`.
