---
layout: page
title: vvv-config.yml - Utilities
permalink: /documentation/vvv-config/utilities/
---

## Utilities

This key is where you define all optional utilities in the installation. If a utility is not defined here it will not be provisioned.

Each key in this array should be the name of a utility repository defined in the utility-repos key, with its value set to a list of utilities to install.

## Utility Repos

This key is where you define custom sources for utilities.
Each element in this array should be a key value pair where the key in the repo name and the value is a git repository.

The official repository is permanently defined and points to `https://github.com/Varying-Vagrant-Vagrants/vvv-utilities.git`

## Examples

This example defines 2 custom repositories & installs utilities from both of these and the official repo.

```yaml
utility-repos:
  unofficial: https://github.com/LoreleiAurora/vvv-utilities-2.git
  unofficial2: https://github.com/LoreleiAurora/vvv-utilities-3.git
  
utilities:
  official:
    - memcached-admin
    - opcache-status
    - phpmyadmin
    - webgrind
  unofficial:
    - test1
    - test2
    - test3
  unofficial2:
    - test4
    - test5
    - test6
```