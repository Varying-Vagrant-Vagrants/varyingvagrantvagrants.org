---
category: 2. Getting Started
order: 3
title: Hyper-V
description: Using VVV with Hyper-V on Windows.
permalink: /docs/en-US/installation/keeping-up-to-date/
---

VVV recommends using VirtualBox, but some Windows users have Hyper-V turned on preventing VirtualBox from running. As a result, VVV needs to be provisioned with slightly different settings.

When using VVV, add the provider flag to your commands like this:

```
vagrant up --provider=hyperv
```

VVV running via Hyper-V isn't used as often as other providers, so if you run into problems, raise an issue on GitHub
