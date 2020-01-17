---
category: 2. Getting Started
order: 3
title: Hyper-V
description: Using VVV with Hyper-V on Windows.
permalink: /docs/en-US/installation/hyper-v/
---

VVV recommends using VirtualBox, but some Windows users have Hyper-V turned on preventing VirtualBox from running. As a result, VVV needs to be provisioned with slightly different settings.

To use HyperV, you must run the command prompt or shell as an administrator. If you do not do this, Vagrant will refuse to run with hyperv. You must also have hyperv turned on in Windows. This can be done using a powershell command or via control panel.

We also recommend using the vb guest vagrant plugin when using `hyperv`, which can sometimes avoid filesystem mounting issues:

```sh
vagrant plugin install vagrant-vbguest
```

When using VVV, add the provider flag to your commands like this:

```
vagrant up --provider=hyperv
```

Note that when mounting folders into the VM, Vagrant will require an administrator login and password to setup the SMB shares. These are Windows credentials, specific to the host Windows machine, not VVV credentials. This is usually your current accounts user and login, as most Windows accounts have admin priviledges.

### Networking

You might also be asked what kind of network you would like to use. This is because Vagrant cannot setup the networking automatically.

As a result, Vagrant cannot enforce an IP, you will need to note down the IP that hyperv gives you in the vagrant output

### Streamlining Commands

You can also remove the `--provider=hyperv` part by modifying `config/custom.yml` so that the provider parameter is uncommented and set to hyperv, e.g.:

```yaml
vm_config:
  memory: 2048
  cores: 2
  provider: hyperv
```

### Troubleshooting HyperV

VVV running via hyperv isn't used as often as other providers, so if you run into problems, raise an issue on GitHub. You can also use the HyperV Management console to manually shutdown and destroy virtual machines.
