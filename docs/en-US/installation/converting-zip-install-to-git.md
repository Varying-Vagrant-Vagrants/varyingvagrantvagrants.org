---
category: 2. Getting Started
order: 4
title: Converting to a Git Install
description: Convert a non-git install to use git.
permalink: /docs/en-US/installation/convert-to-git/
---

If you installed VVV via a `zip` download rather than using `git`, you can still convert your install without reinstalling from scratch. This way you can keep your copy of VVV updated. Before doing this though, make sure you've copied `vvv-config.yml` to `vvv-custom.yml`, any changes to that file will be overwritten.

First, navigate in the terminal to the VVV folder, and run the following commands:

```shell
git init
git remote add origin https://github.com/Varying-Vagrant-Vagrants/VVV.git
git fetch
git reset origin/master
git checkout -f origin/master
```

Once this is done, run `vagrant reload --provision` to update. Remember to copy your config from `vvv-config.yml` to `vvv-custom.yml` before doing this or your configs changes will be overwritten.
