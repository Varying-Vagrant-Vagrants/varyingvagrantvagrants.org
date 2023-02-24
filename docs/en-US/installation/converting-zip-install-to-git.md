---
category: 2. Getting Started
order: 6
title: Converting to a Git Install
description: Convert a non-git install to use git.
permalink: /docs/en-US/installation/convert-to-git/
---

If you installed VVV via a `zip` download rather than using `git`, you can still convert your install without reinstalling from scratch. This way you can keep your copy of VVV updated. 

> Note: You should review the [News &amp; Changelog](/blog/) blog. Sometimes you will also need to update the underlying software such as Vagrant, its plugins or VirtualBox in order for this process to be successful.

First, navigate in the terminal to the VVV folder, and run the following commands:

```shell
git init
git remote add origin https://github.com/Varying-Vagrant-Vagrants/VVV.git
git fetch
git reset origin/stable
git checkout -f origin/stable
git checkout stable
git branch --set-upstream-to=origin/stable stable
git pull
```

Once this is done, run `vagrant up --provision` to update.
