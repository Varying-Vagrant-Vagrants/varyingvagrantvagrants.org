---
category: 6. Reference
order: 1
title: vm_config
description: vm_config is an optional section of the VVV configuration file that allows setting virtual machine parameters.
permalink: /docs/en-US/vm-config/
---

This is an optional section of the VVV configuration file that allows setting virtual machine parameters.

For example, this will tell VVV to create a Virtual Machine with 1024MB of RAM and a single cpu core:

```yaml
vm_config:
  memory: 1024
  cores: 1
```

You can also specify the `box` and `provider` used to create the VM.
