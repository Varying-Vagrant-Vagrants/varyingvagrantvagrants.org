---
category: 5. Troubleshooting
order: 4
title: VM Configuration
description: Use vvv-config.yml to customize the virtual machine
permalink: /docs/en-US/troubleshooting/vm_config
---

You can make modifications to how the virtual machine is provisioned by creating and/or editing a block of your `vvv-custom.yml` file called `vm_config`.

## Changing virtual machine memory and cores

```yaml
vm_config:
  memory: 2048
  cores: 2
```
