---
category: 6. Reference
order: 2
title: Vagrantfile and Customfile
permalink: /docs/en-US/references/vagrantfile/
---

VVV is based on Vagrant and the Vagrantfile it's the top of the implementation that can be customized.

## How VVV use Vagrantfile

A [Vagrantfile][https://www.vagrantup.com/docs/vagrantfile/] is a Ruby file that Vagrant use to set up the Virtual machine with the various settings and execute the provisioning and other stuff.

The VVV implementation includes the support for different VM providers other to Virtualbox, as Parallels or VMware and Hyper-V but the support for this other solutions is not guaranteed.
As latest release includes support for the [vagrant-hostsupdated](https://github.com/cogitatio/vagrant-hostsupdater) plugin so it is possible to auto refresh the `/etc/hosts` of the host machine automatically.

Includes also the automatic migration from older `vvv-config.yml` to the new [config.yml](https://varyingvagrantvagrants.org/docs/en-US/config/) and of the old sql `backup` folder.

On loading the first step is to read the `config.yml` and load the settings, apply some default values to the various websites and to the box. Will print on the console some information about the host machine and if can detect other plugin supported ([vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) and [vagrant-disksize](https://github.com/sprotheroe/vagrant-disksize)).

The next step is to mount the various VVV folders inside the VM machine with the dedicated settings for the various VM providers.
The final steps are to define the provision scripts, settings for the various plugins and provisions for some utilities and tools like the VVV dashboard.

### Customization

#### Customfiles

VVV includes the ability to extend the vagrant file with custom files. By placing a `Customfile` in the main VVV folder, you can add additional Vagrant directives. Note that a `Customfile` adds to the vagrant file, it does not replace the main vagrant file.

Customfiles can be used to modify VM options, or mount additional shared folders. For this reason, no support is offered by the maintainers, and a familiarity with how vagrant works is expected.

Community resources:

* [2 new commands for VVV](https://gist.github.com/Mte90/9810f7c2775f1fd79ee049b3d259dff0) - `vagrant command wordpress-develop "grunt watch"` or `vagrant script xdebug_off"`

#### provision-custom.sh

It is possible to run a custom file [provision.sh](https://github.com/Varying-Vagrant-Vagrants/VVV/blob/develop/provision/provision.sh) that will be executed as replacement, just put a file `provision-custom.sh` inside the provision folder.

#### provision-post.sh

It is executed if available at the end of the provision, can be used to install additional packages without having to replace the entire default provisioning script.

### Troubleshooting

Providers other than virtualbox e.g. Parallels, aren't tested as thoroughly, mainly from a lack of available testers for those providers. As a result over time things might break without the maintainers being aware. The most common issue is the folder permissions specified in the vagrant file, either being incorrect or requiring additional parameters.
