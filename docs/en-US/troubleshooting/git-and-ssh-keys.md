---
category: 5. Troubleshooting
order: 6
title: Git and SSH Keys
description: Diagnosing issues with SSH git repos and SSH keys.
permalink: /docs/en-US/troubleshooting/git-and-ssh-keys/
---

The VVV git repositories are set using https URLs so that they work out of the box, but if you want to use SSH URLs instead, or for private repositories, SSH Agent forwarding enables this. VVV support SSH Agent forwarding, but the host machine may not be set up for this.

_Note: for public repositories, such as the VVV repositories, you can use the `https` git urls instead._

Before we continue, to use SSH you must:

 - Have an SSH client present
 - Have SSH keys set up on your host machine
 - Have an SSH Agent running
 - Have SSH Agent forwarding turned on

## Confirm an SSH Client is Present

This mainly affects Windows users. Most Windows users will need an SSH client installed, luckily [installing Git](https://git-scm.com/) does this for most users.

## Confirm That The Host Machine Has SSH Keys

To use SSH git repos, SSH keys must be set up. If you have never done this before then [GitHub has articles here on how to use/add/setup SSH keys](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).

## Confirm That You Can SSH to GitHub/GitLab/etc

On the host machine and the guest machine, run `ssh -T git@github.com` to test that you can connect to GitHub. Replace `github.com` with your domain of choice if using a different git provider.

This is what a succesful response should look like:

```
❯ ssh -T git@github.com
Hi <your username>! You've successfully authenticated, but GitHub does not provide shell access.
```

Test the host first, if the host cannot connect then this must be fixed first. If it works on the host, but does not work in VVV, then this suggests that SSH forwarding is inactive or disabled.

## Confirming SSH Forwarding Is Enabled

Check the SSH config file contains the `AddKeysToAgent` parameter. This file can normally be found at `~/.ssh/config`.

We recommend adding this:

```
Host *
   AddKeysToAgent yes
   ForwardAgent yes
```

If you are still having issues, [visit this super useful article from GitHub on debugging/setting up SSH Forwarding on your host](https://developer.github.com/v3/guides/using-ssh-agent-forwarding/).
