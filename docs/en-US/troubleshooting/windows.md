---
category: 5. Troubleshooting
order: 10
title: Windows
description: Windows issues.
permalink: /docs/en-US/troubleshooting/windows/
---

## Timeouts

If you are using Windows and see this:

```
==> default: flag to force provisioning. Provisioners marked to run always will still run.
==> default: Running action triggers after up ...
==> default: Running trigger: VVV Post-Up...
==> default: Trigger run failed
==> default: An error occurred in the underlying SSH library that Vagrant uses.
==> default: The error message is shown below. In many cases, errors from this
==> default: library are caused by ssh-agent issues. Try disabling your SSH
==> default: agent or removing some keys and try again.
==> default:
==> default: If the problem persists, please report a bug to the net-ssh project.
==> default:
==> default: timeout during server version negotiating
```

Then it's likely you don't have a working SSH Agent, or you are using VirtualBox and have issues with your computer going to sleep.

### Missing SSH Agents

In order to talk to the VM we need an SSH Agent, and since Windows doesn't support this we ask that you install Git for Windows as it comes with one.

Unfortunately sometimes the SSH Agent doesn't start or it exits/ends for various reasons, leading to the timeout issue above. You can work around this by restarting the SSH Agent, and making sure you're using git bash ( some terminals don't work with git bash's SSH agent, or have conflicting issues, e.g. Powershell ISE ).

To fix this, we recommend that:

 - use Git Bash to run `vagrant` commands on Windows
 - If using VirtualBox, use at least VirtualBox 7 or higher
 - Ensure the SSH Agent is running by using the command `eval "$(ssh-agent -s)"`

[It's also strongly recommended you read this GitHub troubleshooting article for more information and solutions.](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases)

#### Can I Use The OpenSSH Windows Service?

No. While this service has an SSH Agent, Vagrant does not know how to talk to it, so it cannot be used. Vagrant knows how to talk with the ssh agents provided by cygwin and git bash.

### VirtualBox and Sleep

There is a known bug in VirtualBox that makes a VM unreachable when your computer goes to sleep, e.g. closing a laptops lid. If your VVV instance works but then mysteriously breaks if you put your computer to sleep, yet a `vagrant up` after a full restart works then this may be the cause of your troubles.

Whil there is no VVV specific solution to this, we recommend that:

 - Keep VirtualBox and Windows up to date
 - Run `vagrant halt` or `vagrant suspend` before putting your machine to sleep, then waking it up with `vagrant up` when you return.
 - Investigating an alternative provider such as Docker or Hyper-V that doesn't have this problem.

## Symlink Provisioning Errors

If you're seeing errors related to creating symlinks in the provisioning then you need to double check that you're using an admin/elevated command prompt to run the vagrant provisioning commands. This is because on Windows creating a symlink requires elevated priviledges that a normal command prompt doesn't have. You might be able to get away with a `vagrant up` for a VM that has already been created though.
