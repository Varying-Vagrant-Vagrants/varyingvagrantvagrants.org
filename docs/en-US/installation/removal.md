---
category: 2. Getting Started
order: 10
title: Uninstallation
description: Sad to see you go.
permalink: /docs/en-US/uninstallation/
---

If you want to remove VVV, open a terminal or elevated command prompt, and change into the VVV folder. Then run:

```shell
vagrant destroy
```

This will destroy and delete the VVV virtual machine, including the database. Your `www` folder with code and sites will remain intact.

Once the Virtual Machine is destroyed, you may delete the VVV folder, or uninstall Vagrant and VirtualBox.
