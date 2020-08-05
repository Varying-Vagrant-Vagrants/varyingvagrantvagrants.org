---
category: 5. Troubleshooting
order: 3
title: Can't Find vvv.test
description: What to do if you can't load vvv.test.
permalink: /docs/en-US/troubleshooting/cant-find-vvv.test/
---

After a `vagrant up`, you can visit the dashboard at http://vvv.test, but if this doesn't work for you, try some of the checks/solutions below.

## Manually Updating The Hosts File

If you can't solve the problem, fear not, you can manually add the entries to the hosts file by hand. The automatic hosts file updating is not necessary, it just makes life a lot nicer for developers.

## Check The Hosts File Was Updated

Your browser will know how to reach vvv.test because entries were added to the system hosts file connecting the IP to the host.

These might look like this:

```
192.168.50.4  vvv  # VAGRANT: 531fdd4811bf3857f272c5d0d16c9b53 (default) / dde91da8-b765-451a-939b-81d7e219db8c
192.168.50.4  vvv.test  # VAGRANT: 531fdd4811bf3857f272c5d0d16c9b53 (default) / dde91da8-b765-451a-939b-81d7e219db8c
192.168.50.4  one.wordpress.test  # VAGRANT: 531fdd4811bf3857f272c5d0d16c9b53 (default) / dde91da8-b765-451a-939b-81d7e219db8c
192.168.50.4  two.wordpress.test  # VAGRANT: 531fdd4811bf3857f272c5d0d16c9b53 (default) / dde91da8-b765-451a-939b-81d7e219db8c
```

If there are not entries for vvv.test and the other hosts in your config, they won't load in the browser.

Make sure that:

 - You have the vagrant plugins needed by VVV installed
 - No software is interfering
   - Antivirus can prevent changes to the hosts file
   - Gasmask on MacOS can overwrite the changes it it's open when you run `vagrant up`
 - If you're on Windows, that you're using an elevated command prompt
   - If you do not, vagrant and the plugins will not have permission to alter the hosts file

## Check VPN Extensions and Security Software

Some users find that even if everything was set up correctly, they're unable to load vvv.test. On closer inspection VPN extensions have interfered with things. Check for this by disabling VPNs and trying again. Make exceptions for VVV hosts if your networking provides that.

## Windows Users

If provisioning says that the hosts have been added, but the hosts file does not get updated, you may have encountered a problem with the vagrant hosts updater plugin. This is unfortunate and means there is nothing that can be done at the VVV end of things to fix the plugin. You will need to raise an issue on their GitHub.

## It Always Loads the Dashboard

If visiting a site loads the dashboard instead, then you do not have a hosts issue, the issue is elsewhere. This document is not for you. Instead, check that provisioning of that site was succesful by looking at the terminal output, and the logs folder.

It's also possible that you have more than one copy of VVV running, and they're randomly taking turns serving you the address. You can fix that by turning all of them off except one.
