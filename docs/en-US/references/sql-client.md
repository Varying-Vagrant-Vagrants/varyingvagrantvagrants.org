---
category: 6. Reference
order: 8
title: Using an SQL Client
description: How to set up an SQL client such as Sequel Pro for working with the VVV database
permalink: /docs/en-US/references/sql-client/
---

You can work with the database from inside the VM with WP CLI or `mysql`, and even from [PHPMyAdmin](http://vvv.test/phpmyadmin), but some users prefer software such as HeidiSQL, or Sequel Pro.

To connect using an external sql client, there are 3 methods:

 - Sequel Pro config file
 - Direct
 - SSH tunnel

We'll be using Sequel Pro to demonstrate, but the same goes for any other software you might prefer to use.

### Predefined Sequel Pro Config

A Sequel Pro config can be found at `database/sequelpro.spf`, importing this will configure Sequel Pro automatically.

### Direct Connections

To do this, you need to connect to the Virtual Machine, not localhost, using the username and password `external`. This type of connection is useful for PHPStorm.

| Field    	| Value    	|
|----------	|----------	|
| host     	| vvv.test 	|
| username 	| external 	|
| password 	| external 	|

Leave the database and port fields blank. Here is an screenshot for reference:

![A screenshot of Sequel Pro showing direct connection settings]({{ "/images/sql-direct.png"|absolute_url}})

### Using an SSH Tunnel

Similar to the Direct connection, choose the SSH option. Then, you will need to tell the software how to SSH into VVV, and the MySQL details to use once it's inside

| Field          	| Value     	|
|----------------	|-----------	|
| SSH host       	| vvv.test  	|
| SSH username   	| vagrant   	|
| SSH password   	| vagrant   	|
| MySQL host     	| 127.0.0.1 	|
| MySQL username 	| root      	|
| MySQL password 	| root      	|

Leave the database and port fields blank.

![A screenshot of Sequel Pro showing direct connection settings]({{ "/images/sql-ssh-tunnel.png"|absolute_url}})
