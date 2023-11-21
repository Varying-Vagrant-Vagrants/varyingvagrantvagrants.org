---
category: 2. Getting Started
order: 1
title: Installation
description: VVV can be installed with git by cloning the main VVV repo into a local directory or by downloading a zip file. Start VVV with 'vagrant up'.
permalink: /docs/en-US/installation/
---

There are 3 steps to getting VVV running:

1. Install pre-requisite tools/software
2. Install VVV
3. Start VVV from the command line/terminal then visit the dashboard

## 1. Install Pre-requisite software

Before you can install VVV you need to **install these two tools** if they aren't already installed:

[Vagrant](https://www.vagrantup.com/downloads.html){: .btn target="_blank"}
[Git](https://git-scm.com/downloads){: .btn target="_blank"}{: .btn target="_blank"}

**You also need to choose a provider to host the server**, this could be VirtualBox/Docker/Parallels/etc, use the tabs below to choose a provider. _Most of the time VirtualBox is best unless you use a Mac._

{% tabs platform %}

{% tab platform Windows %}
[VirtualBox](https://www.virtualbox.org/wiki/Downloads){: .btn target="_blank"}
[Hyper-V](hyper-v.md){: .btn target="_blank"}
[Docker (see docker tab)](#){: .btn.disabled}

Windows users with Docker installed or Hyper-V turned on should avoid VirtualBox. VirtualBox can be unreliable when Hyper-V is turned on.

{% endtab %}

{% tab platform MacOS (Intel) %}
[VirtualBox](https://www.virtualbox.org/wiki/Downloads){: .btn target="_blank"}
[Parallels Business/Pro*](https://www.parallels.com/){: .btn target="_blank"}
[Docker (see docker tab)](#){: .btn.disabled}

For Parallels you will also need to install the `vagrant-parallels` plugin.

{% endtab %}

{% tab platform MacOS (Arm/M1) %}
[Parallels Business/Pro*](https://www.parallels.com/){: .btn target="_blank"}
[Docker (see docker tab)](#){: .btn.disabled}
[❕ VirtualBox](#){: .btn.disabled}

For Parallels you will also need to install the `vagrant-parallels` plugin. For docker see the docker tab.

### Why Can't I Use VirtualBox on Apple Silicon?

While there is a technical preview it does not work with vagrant, and cannot run modern operating systems. Please check back in 5 years ( eta 2028/2032, total guess ).

{% endtab %}

{% tab platform Linux %}
[VirtualBox](https://www.virtualbox.org/wiki/Downloads){: .btn target="_blank"}
[Docker (see docker tab)](#){: .btn.disabled}
{% endtab %}

{% tab platform Docker (v3.13+) %}

We have _experimental_ docker support on the `develop` branch/v3.13+. You will need docker desktop if your platform doesn't have docker already installed:

[Docker Desktop](https://www.docker.com/products/docker-desktop/){: .btn target="_blank"}

Note that Docker support is work in progress, and there is still a lot of work to do, but it does provide options for those on Arm devices and can be useful.

To use the docker provider, pass `--provider="docker"` when provisioning VVV, and set docker as the provider in `config/config.yml`. Note that there is no migration path from non-docker to docker, so if you plan to switch you will need to export your database, destroy the VM, then recreate it with the docker provider.

### Important Notes For Docker Users

There are some caveats to using docker with VVV:

 - You may see additional warnings in the provisioner output, such as not being able to synchronise clocks. While we'd like help resolving these, they should only concern you if VVV does not work after provisioning completes.
 - You cannot use VVV at the same time as competing docker based local dev servers due to how port mapping works.
   - This is a docker limitation not a VVV limitation and affects other docker dev environments too.
   - If this happens, halt the other dev environment then start VVV. Importantly make sure to stop the proxy container that has the ports mapped, some dev environments shutdown the other containers but keep the Traefik based proxy alive with the ports mapped.
 - VVV is currently a monolithic container solution. While it would be great to give each site its own container this is planned for a future major version of VVV e.g. VVV 4 or 5 as it would be a major breaking change.
 - We're actively seeking assistance in improving our docker setup, it is by no means final.


{% endtab %}

{% endtabs %}


Reboot your computer after installing the above software.

## 2. Installing VVV

We're going to install VVV to a `vvv-local` folder in your home directory. First, grab a copy of VVV using `git`. Open a terminal or a command prompt, and enter the following command:

{% tabs installcommand %}

{% tab installcommand MacOS/Linux %}

In a terminal:

```sh
git clone -b stable https://github.com/Varying-Vagrant-Vagrants/VVV.git ~/vvv-local
cd ~/vvv-local
vagrant plugin install --local
```

{% endtab %}

{% tab installcommand Windows %}

In an elevated/admin command prompt:

```powershell
git clone -b stable https://github.com/Varying-Vagrant-Vagrants/VVV.git %systemdrive%%homepath%/vvv-local
cd %systemdrive%%homepath%/vvv-local
vagrant plugin install --local
```

This should have created a `vvv-local` folder in your users main folder, e.g. `C:\Users\myusername\` alongside the documents/pictures/videos/etc folders.

{% endtab %}
{% endtabs %}

Alternatively you can download a zip file from github but we strongly recommend against this though, as it makes updating VVV _much_ harder. If you did this, skip the first commmand.

At this point you might want to adjust the `config/config.yml` file before VVV creates the local developer environment. This is your opportunity to do so. You might do this in order to change the provider vagrant uses to Hyper-V instead of VirtualBox, or to provision additional sites the first time the VM is created to save time.

## 3. Starting VVV

Start VVV by opening a terminal, changing to the VVV folder, and running `vagrant up`. For example:

{% tabs startcommand %}
{% tab startcommand MacOS/Linux %}

```sh
cd ~/vvv-local
vagrant up
```

{% endtab %}
{% tab startcommand Windows %}

```powershell
cd %systemdrive%%homepath%/vvv-local
vagrant up
```

{% endtab %}
{% endtabs %}

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
