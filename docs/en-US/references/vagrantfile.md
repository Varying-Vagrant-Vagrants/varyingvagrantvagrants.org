---
category: 6. Reference
order: 2
title: The Vagrantfile and Customfile's
permalink: /docs/en-US/references/vagrantfile/
---

The `Vagrantfile` is how VVV configures Vagrant, but it can be extended with a `Customfile`

## How VVV uses the `Vagrantfile`

The [Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/) is a Ruby file that tells Vagrant how to set up the Virtual machine.

This file also does some housekeeping, such as copying `config/default-config.yml` to `config/config.yml`, migrating from the old config locations, and printing out the VVV splash logo with debugging info.

### Our `Vagrantfile`'s structure

On loading the first step is to read the `config.yml` and load the settings, apply some default values to the various websites and to the box. Will print on the console some information about the host machine and if can detect other plugin supported ([vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) and [vagrant-disksize](https://github.com/sprotheroe/vagrant-disksize)).

The next step is to mount the various VVV folders inside the VM machine with the dedicated settings for the various VM providers.

The final steps are to define the provision scripts, settings for the various plugins and provisions for some utilities and tools like the VVV dashboard.

## Customization

### Customfiles

VVV includes the ability to extend the vagrant file with custom files. By placing a `Customfile` in the main VVV folder, you can add *additional* Vagrant directives. Note that a `Customfile` adds to the vagrant file, it does not replace the main vagrant file.

Customfiles can be used to modify VM options, or mount additional shared folders. For this reason, no support is offered by the maintainers, and a familiarity with how vagrant works is expected.

Community resources:

* [2 new commands for VVV](https://gist.github.com/Mte90/9810f7c2775f1fd79ee049b3d259dff0) - `vagrant command wordpress-develop "grunt watch"` or `vagrant script xdebug_off"`

#### provision-post.sh

If a `provision/provision-post.sh` is found, this file will be ran at the end of the main provisioner. This provides an opportunity to add additional packages.

Note that we recommend using custom utilities instead to install extra packages.

#### provision-custom.sh

If a `provision-custom.sh` file is placed in the `provision` folder, VVV will run that file instead of [`provision.sh`](https://github.com/Varying-Vagrant-Vagrants/VVV/blob/develop/provision/provision.sh) as the main provisioner.

We recommend against doing this though, and keep it for legacy reasons.

### Troubleshooting

Providers other than Virtualbox e.g. Parallels, aren't tested as thoroughly, mainly from a lack of available testers for those providers. As a result over time things might break without the maintainers being aware. The most common issue is the folder permissions specified in the vagrant file, either being incorrect or requiring additional parameters. If you find yourself in this situation, please open a new issue on GitHub or ask in Slack.
