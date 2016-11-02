---
layout: default
title: Varying Vagrant Vagrants
---

The primary goal of [Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV) (VVV) is to provide an approachable development environment with a modern server configuration.

VVV is ideal for developing themes and plugins as well as for [contributing to WordPress core](https://make.wordpress.org/core/).

## Requirements

VVV requires recent versions of both Vagrant and VirtualBox to be installed.

[Vagrant](https://www.vagrantup.com) is a "tool for building and distributing development environments". It works with [virtualization](https://en.wikipedia.org/wiki/X86_virtualization) software such as [VirtualBox](https://www.virtualbox.org/) to provide a virtual machine sandboxed from your local environment.

In addition to VirtualBox, provider support is also included for Parallels, Hyper-V, VMWare Fusion, and VMWare Workstation.

## Quick Start

1. Install [VirtualBox 5.1.x](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant 1.8.x](https://www.vagrantup.com/downloads.html)
1. (Optional) Install the [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) plugin with `vagrant plugin install vagrant-hostsupdater`
	* If you choose not to install this plugin, a manual entry should be added to your local `hosts` file that looks like this: `192.168.50.4  vvv.dev local.wordpress.dev local.wordpress-trunk.dev src.wordpress-develop.dev build.wordpress-develop.dev`
1. (Optional) Install the [vagrant-triggers](https://github.com/emyl/vagrant-triggers) plugin with `vagrant plugin install vagrant-triggers`
    * Note: This step is not a requirement. When installed, it allows for various scripts to fire when issuing commands such as `vagrant halt` and `vagrant destroy`.
1. (Optional) Install the [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) plugin with `vagrant plugin install vagrant-vbguest`.
1. Clone or download and extract the Varying Vagrant Vagrants project from GitHub into a local directory, using either:
    * SSH: `git clone git@github.com:Varying-Vagrant-Vagrants/VVV.git .`
    * HTTPS: `git clone https://github.com/Varying-Vagrant-Vagrants/VVV.git .`
    * Download: [https://github.com/Varying-Vagrant-Vagrants/VVV/archive/develop.zip](https://github.com/Varying-Vagrant-Vagrants/VVV/archive/develop.zip)
1. In a command prompt, change into the new directory with `cd vagrant-local`
1. Start the Vagrant environment with `vagrant up`
    * Be patient as the magic happens. This could take a while on the first run as your local machine downloads the required files.
1. Visit any of the following default sites in your browser:
    * [http://local.wordpress.dev/](http://local.wordpress.dev/) for WordPress stable
    * [http://local.wordpress-trunk.dev/](http://local.wordpress-trunk.dev/) for WordPress trunk
    * [http://src.wordpress-develop.dev/](http://src.wordpress-develop.dev/) for trunk WordPress development files
    * [http://build.wordpress-develop.dev/](http://build.wordpress-develop.dev/) for the version of those development files built with Grunt
    * [http://vvv.dev/](http://vvv.dev/) for a default dashboard containing several useful tools

## What Did That Do?

The first time you run `vagrant up`, a packaged box containing a basic virtual machine is downloaded to your local machine and cached for future use. The file used by Varying Vagrant Vagrants contains an installation of Ubuntu 14.04 and is about 332MB.

After this box is downloaded, it begins to boot as a sandboxed virtual machine using VirtualBox. Once booted, it runs the provisioning script included with VVV. This initiates the download and installation of around 100MB of packages on the new virtual machine.

On future runs of `vagrant up`, the packaged box will be cached on your local machine and Vagrant will only need to apply the requested provisioning.

## Using VVV

Now that you're up and running, start poking around and modifying things.

1. Access the server via the command line with `vagrant ssh` from your `vagrant-local` directory. You can do almost anything you would do with a standard Ubuntu installation on a full server.
    * **MS Windows users:** An SSH client is generally not distributed with Windows PCs by default. However, a terminal emulator such as [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) will provide access immediately. For detailed instructions on connecting with PuTTY, consult the [VVV Wiki](https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Connect-to-Your-Vagrant-Virtual-Machine-with-PuTTY).
1. Power off the box with `vagrant halt` and turn it back on with `vagrant up`.
1. Suspend the box's state in memory with `vagrant suspend` and bring it right back with `vagrant resume`.
1. Reapply provisioning to a running box with `vagrant provision`.
1. Destroy the box with `vagrant destroy`. Files added in the `www` directory will persist on the next `vagrant up`.
1. Start modifying and adding local files to fit your needs. Take a look at [Auto Site Setup](https://github.com/varying-vagrant-vagrants/vvv/wiki/Auto-site-Setup) for tips on adding new projects.

## Documentation

The [documentation](documentation/) area of this site is in progress. The [VVV Wiki](https://github.com/varying-vagrant-vagrants/vvv/wiki) contains documentation that may help. Open a [new issue on GitHub](https://github.com/Varying-Vagrant-Vagrants/VVV) if you run into trouble or have any tips that we need to know.

## Copyright / License

The code powering [Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV) and this [website](https://github.com/Varying-Vagrant-Vagrants/varyingvagrantvagrants.org) is copyright (c) 2014-2016, the contributors of the VVV project under the [MIT License](https://opensource.org/licenses/MIT).
