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

Then it's likely you don't have a working SSH Agent. The primary reason git is listed in the software requirements is because it installs git bash and provides an SSH Agent that Vagrant knows how to talk to.

It's also possible that your SSH Agent previously worked but is no longer running!

To fix this, we recommend that:

 - use Git Bash to run vagrant commands on Windows
 - If using VirtualBox, use at least VirtualBox 7 or higher
 - Ensure the SSH Agent is running by using the command `eval "$(ssh-agent -s)"`

## Symlink Provisioning Errors

If you're seeing errors related to creating symlinks in the provisioning then you need to double check that you're using an admin/elevated command prompt to run the vagrant provisioning commands. This is because on Windows creating a symlink requires elevated priviledges that a normal command prompt doesn't have. You might be able to get away with a `vagrant up` for a VM that has already been created though.
