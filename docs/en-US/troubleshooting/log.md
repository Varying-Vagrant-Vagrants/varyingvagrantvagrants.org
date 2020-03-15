---
category: 5. Troubleshooting
order: 3
title: How to find the logs
description: How works the log generation in VVV
permalink: /docs/en-US/troubleshooting/logs/
---

How to find the logs that can be helpful for VVV debugging

## Where are the VVV logs

In the VVV root folder inside the `log` folder you can find all the logs generated inside the virtual machine, from apt to nginx and also the one about provision.  

### How they are structured

VVV hide some output during the provision inside the console to be less verbose and help during the usage to find the important part of the process.  
For debugging and transparency reasons this output is placed inside the `log/provisioners` in a specific folder with the name of the timestamp of that running.  

Inside this last folder there are various logs:

* For any core for the utility in your `config.yml`
* For every utilities that you installed in your `config.yml`
* For any website configured in your `config.yml`
* One for the dashboard
* The main one about the core VVV process