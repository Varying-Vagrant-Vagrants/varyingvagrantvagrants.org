---
category: 1. Introduction
order: 5
title: How to contribute
description: The VVV core project is built by volunteers that help on adding new features, improve documentation and also fix new bugs.
permalink: /docs/en-US/contribute/
---

## Development

VVV is built with multiple repositories, but [we track tickets on the main VVV repositorys issues](https://github.com/Varying-Vagrant-Vagrants/VVV/).

Every ticket is labelled by the project that it involves, like the provision for the [custom-site-template](https://github.com/Varying-Vagrant-Vagrants/custom-site-template) or the [dashboard](https://github.com/Varying-Vagrant-Vagrants/dashboard).

Pick an issue that is interesting for you, and don't hesitate to ask for hints on the tickets itself, so we can track openly every feedback to achieve better results.

The [CD-USB-Generator](https://github.com/Varying-Vagrant-Vagrants/CD-USB-Generator) is the exception to the rule of the issue in the main repo. This repo contains scripts to generate USB sticks with copies of VVV for WordCamp contributor days.

## Testing

The workflow is simple, a contributor opens a pull request, and the VVV testers team is alerted of it. To test is required a bit of knowledge of Linux, git and command line.

We suggest to install in your machine [hub](https://hub.github.com/) globally because simplify a lot the workflow of creating a new branch with the code of the pull request.

Hub is a wrapper for git that extend his features without noticing it, so you can use it without any issues in other projects.

Example:

* There is a new pull request (e.g. https://github.com/Varying-Vagrant-Vagrants/VVV/pull/1686)
* `git checkout https://github.com/Varying-Vagrant-Vagrants/VVV/pull/1686` automatically will create a new branch with the code of the pull request
* Now you are testing the pull request so you need to turn on VVV
* `vagrant up` is the first command to try to see for errors in the log
* `vagrant provision` to test if the provision will works without any errors
* `vagrant halt` to test if the halt of the machine doesn't have any issue

That's it!

Another suggestion is to check the pull request ticket for other things to verify like commands or features to do a better test.
