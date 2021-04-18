---
category: 2. Getting Started
order: 7
title: System Requirements
description: VVV requires recent versions of both Vagrant and VirtualBox to be installed, along with some vagrant plugins.
permalink: /docs/en-US/installation/software-requirements/
---

VVV requires recent versions of Vagrant, git and VirtualBox to be installed, along with some vagrant plugins.

## Software Requirements

First make sure you have all the necessary software installed for VVV to run:

[VirtualBox*](https://www.virtualbox.org/wiki/Downloads){: .btn target="_blank"}
[Vagrant](https://www.vagrantup.com/downloads.html){: .btn target="_blank"}
[Git](https://git-scm.com/downloads){: .btn target="_blank"}{: .btn target="_blank"}

_* On Windows, if you have Docker installed then VirtualBox should be substituted for [Hyper-V](hyper-v.md). Hyper-V provides better performance and reliability._

Reboot your computer after installing the above software.

## Hardware Requirements

|                      | Minimum | Recommended | Notes                                                                                                                                                                                  |
|----------------------|---------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| RAM                  | 4GB     | 8GB+        | The RAM given to the VM can be changed as low as 1GB in the config, but you still need memory for the browser and OS.<br>WordPress Core needs at least 6GB of RAM. |
| CPU Cores            | 2       | 2+          | VVV asks for 2 CPU cores in the config, but more cores can speed up provisioning.                                                                                                            |
| BIOS Virtualisation* | on      |             | On Intel machines this is called Intel VT-x, and AMD calls it AMD-V. For some reason, some Laptop makers turn this off by default. Macs have it turned on out of the box.              |
| Free Disk Space      | 2GB     | 4GB+        | All those sites take up space, make sure you have enough room                                                                                                                          |
| Disk Type            | HD      | SSD         | Mechanical spinning drives will be _very_ slow, we strongly recommend faster solid state drives for VMs.                                                                            |

_* Refer to your machines manufacturer for how to access your BIOS. [This article may be helpful for enabling Intel VT-x](https://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/)_
