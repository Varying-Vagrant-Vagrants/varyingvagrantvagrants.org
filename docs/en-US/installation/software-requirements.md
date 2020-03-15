---
category: 2. Getting Started
order: 1
title: System Requirements
description: VVV requires recent versions of both Vagrant and VirtualBox to be installed, along with some vagrant plugins.
permalink: /docs/en-US/installation/software-requirements/
---

VVV requires recent versions of both Vagrant and VirtualBox to be installed, along with some vagrant plugins.

## Software Requirements

You will need the following software:

| Software                     |  Minimum Version   | Recommended    | Download Link                             |
|------------------------------|--------------------|----------------|-------------------------------------------|
| VirtualBox*                  | 5.x                | Latest version | https://www.virtualbox.org/wiki/Downloads |
| Vagrant                      | 2.2.7              | Latest version | https://www.vagrantup.com/downloads.html  |
| Vagrant Hosts Updater Plugin | n/a                | n/a            | The [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) plugin will modify your hosts file so that provisioned domains such as `http://vvv.test` works. To install it, run `vagrant plugin install vagrant-hostsupdater`   |
| Git                          | n/a                | latest version | For Windows: https://gitforwindows.org/   |

_* On Windows, VirtualBox can be substituted for [Hyper-V](hyper-v.md) if Docker is also being used. The same is true if you choose to use Parallels or VMWare instead of VirtualBox, but, we recommend using VirtualBox as it's both well tested, free, and widely available. Your mileage with alternative VM providers may vary. If Hyper-V is turned on in any form, VirtualBox may not work, or suffer major performance penalties._

## Hardware Requirements

|                      | Minimum | Recommended | Notes                                                                                                                                                                                  |
|----------------------|---------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| RAM                  | 4GB     | 8GB+        | The RAM given to the VM can be changed as low as 1GB in the config, but you still need memory for the browser and OS. Don't attempt to work on WordPress Core on less than 6GB of RAM. |
| CPU Cores            | 2       | 4+          | VVV asks for 2 CPU cores in the config, but more cores will speed things up                                                                                                            |
| BIOS Virtualisation* | on      |             | On Intel machines this is called Intel VT-x, and AMD calls it AMD-V. For some reason, some Laptop makers turn this off by default. Macs have it turned on out of the box.              |
| Free Disk Space      | 2GB     | 4GB+        | All those sites take up space, make sure you have enough room                                                                                                                          |
| Disk Type            | HD      | SSD         | Mechanical spinning drives will be unbearably slow, we strongly recommend faster solid state drives for VMs                                                                            |

_* Refer to your machines manufacturer for how to access your BIOS. [This article may be helpful for enabling Intel VT-x](https://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/)_

## Rebooting

You might need to reboot your machine after installing VirtualBox, particularly on Windows but sometimes on MacOS too. This can manifest as networking issues. A full power cycle will ensure all components are fully installed and loaded
