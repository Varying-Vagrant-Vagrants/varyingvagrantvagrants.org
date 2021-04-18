---
category: 6. Reference
order: 8
title: Using an SQL Client
description: How to set up an SQL client such as Sequel Ace for working with the VVV database
permalink: /docs/en-US/references/sql-client/
---

You can work with the database from inside the VM with WP CLI or `mysql`, and even from [PHPMyAdmin](http://vvv.test/phpmyadmin), but some users prefer software such as HeidiSQL, or Sequel Ace.

To connect using an external sql client, there are two methods:

 - Direct connections
 - SSH tunnel
 
There are also some client specific methods available:

 - Beekeper Studio import URL
 - TablePlus URL
 - Sequel Pro/Sequel Ace config file

Any client you use should be able to use the details listedunder direct connections. We'll be using Sequel Ace to demonstrate, but the same goes for any other software you might prefer to use.

### Direct Connections

These details can be used with any SQL client. To do this, you need to connect to the Virtual Machine, not localhost, using the username and password `external`. This type of connection is useful for PHPStorm.

| Field    	| Value    	  |
|----------	|------------	|
| host     	| `vvv.test` 	|
| port     	| `3306`     	|
| username 	| `external` 	|
| password 	| `external` 	|

Leave the database field blank. If asked for a database type, choose MariaDB, or MySQL if that isn't an option.

Here is an screenshot from Sequel Pro/Ace for reference:

![A screenshot of Sequel Pro showing direct connection settings]({{ "/images/sql-direct.png"|absolute_url}})

### Beekeper Studio import URL

Click on import from URL and enter `mariadb://external@vvv.test:3306` then click import. You should now click on connect, and select a database in the top left dropdown.

[For more information about Beekeeper Studio, click here](https://www.beekeeperstudio.io/).

### TablePlus URL

Add a new connection, and import this URL: `mariadb://external:external@vvv.test`

### Predefined Sequel Pro/Ace Config

A saved config file can be found at `database/sequelpro.spf`, importing this file into Sequel Pro or Sequel Ace will configure a database connection automatically.

The VVV team recommend [Sequel Ace](https://github.com/Sequel-Ace/Sequel-Ace/releases) over Sequel Pro

### Using an SSH Tunnel

Similar to the Direct connection, choose the SSH option. Then, you will need to tell the software how to SSH into VVV, and the MySQL details to use once it's inside.

Note that a direct connection is often easier and simpler to configure.

| Field          	| Value     	  |
|----------------	|-------------	|
| SSH host       	| `vvv.test`  	|
| SSH username   	| `vagrant`   	|
| SSH password   	| `vagrant`   	|
| MySQL host     	| `127.0.0.1` 	|
| MySQL username 	| `root`      	|
| MySQL password 	| `root`      	|

Leave the database and port fields blank.

![A screenshot of Sequel Pro showing direct connection settings]({{ "/images/sql-ssh-tunnel.png"|absolute_url}})
