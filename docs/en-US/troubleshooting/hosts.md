---
category: 5. Troubleshooting
order: 3
title: Can't Find vvv.test
description: What to do if you can't load vvv.test.
permalink: /docs/en-US/troubleshooting/cant-find-vvv.test/
---

After a `vagrant up`, you can visit the dashboard at http://vvv.test, but if this doesn't work for you, try some of the checks/solutions below.

## Should I Reinstall VirtualBox/Vagrant?

This is extremely unlikely to help since they don't handle the hosts. If you can see provisioning happening then vagrant and the provider are unlikely to be the problem.

## Disable VPNs

A regular occurence is that when you try to reach the VM it reaches out through the VPN not locally. This means many popular VPNs are fundamentally incompatible with vagrant VMs such as VVV, with the only fix being to turn off the VPN.

If your VPN provides a workaround for this, or allows you to add VVVs hosts and IPs to a whitelist then try that, otherwise this isn't something VVV can help with, it's a fundamental operating system problem with no workaround other than turning off the VPN.

## Confirm Vagrant Plugins Are Present

VVV uses a vagrant plugin to add the hosts to the hosts file so that your browser can find them. If you forgot to install the plugin then hosts won't load in the browser.

Run `vagrant plugin install --local` in your VVV folder to make sure the needed vagrant plugins are installed.

## Manually Updating The Hosts File

If you can't solve the problem, fear not, you can manually add the entries to the hosts file by hand. The automatic hosts file updating is not necessary, it just makes life a lot nicer for developers.

## Check The Hosts File Was Updated

Your browser will know how to reach vvv.test because entries were added to the system hosts file connecting the IP to the host.

These might look like this:

```
192.168.56.4  vvv.test
192.168.56.4  one.wordpress.test
192.168.56.4  two.wordpress.test
```

If there are not entries for `vvv.test` and the other hosts in your config, they won't load in the browser.

Make sure that:

 - You have the vagrant plugins needed by VVV installed
 - No software is interfering
   - Antivirus can prevent changes to the hosts file
   - Gasmask on MacOS can overwrite the changes it it's open when you run `vagrant up`
 - If you're on Windows, that you're using an elevated command prompt
   - If you do not, vagrant and the plugins will not have permission to alter the hosts file
   - An elevated or administrator prompt is also necessary for certain features such as symlinks

## Vagrant hostsupdater and hostsmanager

You might have used VVV for a long time and have one of these plugins installed. These are known to have issues for some Windows users. Consider removing them in favour of `vagrant-goodhosts`.

### Testing for vvv.local

VVV 3.8+ exposes the dashboard at `http://vvv.local` using bonjour/zeroconf. If you're on MacOS, or have used iTunes or Apple software on Windows you may be able to access the dashboard this way. ( Some printer drivers install a zeroconf client on Windows, and Windows 10 has a zeroconf client built in to more recent versions ).

## Windows Users

If provisioning says that the hosts have been added, but the hosts file does not get updated, you may have encountered a problem with the vagrant goodhosts plugin. This is unfortunate and means there is nothing that can be done at the VVV end of things to fix the plugin. You will need to raise an issue on their GitHub.

## It Always Loads the Dashboard

If visiting a site loads the dashboard instead, then you do not have a hosts issue, the issue is elsewhere. This document is not for you. Instead, check that provisioning of that site was succesful by looking at the terminal output, and the logs folder.

It's also possible that you have more than one copy of VVV running, and they're randomly taking turns serving you the address. You can fix that by turning all of them off except one.
