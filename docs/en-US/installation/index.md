---
category: 2. Getting Started
order: 1
title: Installation
description: VVV can be installed with git by cloning the main VVV repo into a local directory or by downloading a zip file. Start VVV with 'vagrant up'.
permalink: /docs/en-US/installation/
---

First make sure you have all the necessary software installed for VVV to run:

[Vagrant](https://www.vagrantup.com/downloads.html){: .btn target="_blank"}
[Git](https://git-scm.com/downloads){: .btn target="_blank"}{: .btn target="_blank"}

You will also need compatible virtualization software:

[VirtualBox*](https://www.virtualbox.org/wiki/Downloads){: .btn target="_blank"}
[Parallels**](https://www.parallels.com/){: .btn target="_blank"}

_* On Windows, if you have Docker installed then VirtualBox should be substituted for [Hyper-V](hyper-v.md). Hyper-V provides better performance and reliability._

_** Parallels support is currently in beta, but is a viable option for Apple Silicon users. It does, however, require a Business or Pro license._

Reboot your computer after installing the above software.

## Installing VVV

We're going to install VVV to a `vvv-local` folder in your home directory. First, grab a copy of VVV using `git`. Open a terminal or a command prompt, and enter the following command:

Mac/Linux:
```sh
git clone -b stable https://github.com/Varying-Vagrant-Vagrants/VVV.git ~/vvv-local
cd ~/vvv-local
vagrant plugin install --local
```

Windows elevated/admin command prompt:

```powershell
git clone -b stable https://github.com/Varying-Vagrant-Vagrants/VVV.git %systemdrive%%homepath%/vvv-local
cd %systemdrive%%homepath%/vvv-local
vagrant plugin install --local
```

Alternatively you can download a zip file from github but we strongly recommend against this, as it makes updating VVV much harder. If you did this, skip the first commmand.

At this point you might want to adjust the `config/config.yml` file before VVV creates the local developer environment. This is your opportunity to do so. You might do this in order to change the provider vagrant uses to Hyper-V instead of VirtualBox, or to provision additional sites the first time the VM is created to save time.

## Starting VVV

Start VVV by opening a terminal, changing to the VVV folder, and running `vagrant up`. For example:

Mac/Linux:

```sh
cd ~/vvv-local
vagrant up
```

Windows elevated/admin command prompt:

```powershell
cd %systemdrive%%homepath%/vvv-local
vagrant up
```

The first time you run `vagrant up` may take longer while it installs PHP and other tools. When finished it will show a teddy bear and a VVV logo that look like this:

```sh
    default:
    default:   ✧ ▄▀▀▀▄▄▄▄▄▄▄▀▀▀▄ ✧  Thanks for  __ __ __ __
    default:    ✧█▒▒░░░░░░░░░▒▒█    using       \ V\ V\ V /
    default:  ✧   █░░█░░░░░█░░█ ✧                \_/\_/\_/
    default:   ▄▄  █░░░▀█▀░░░█  ▄▄✧
    default:  █░░█ ▀▄░░░░░░░▄▀ █░░█ Vagrant Up has finished! Visit http://vvv.test
    default: ──────────────────────────────────────────────────────────────────────
```

You will find a dashboard at [http://vvv.test](http://vvv.test), and your websites will be in the `www` subfolder.
