---
category: 6. Reference
order: 1
title: Default Credentials
description: Default usernames and passwords for databases and WordPress installations.
permalink: /docs/en-US/default-credentials/
---

## Default Database Users

All sites provisioned via the custom site templates use the `wp` user by default:

| Field    	| Value    	|
|----------	|----------	|
| username 	| wp 	|
| password 	| wp 	|

If you manually create a database via the root MySQL user in PHPMyAdmin or by other means, you will need to grant the `wp` user access to that database. A custom site template will do this for you automatically.

The MariaDB root user should have the following credentials:

| Field    	| Value    	|
|----------	|----------	|
| username 	| root 	|
| password 	| root 	|

However, the `root` user password may need to be set. To do this, SSH into the VM with `vagrant ssh` and run `sudo mysqladmin -u root password root`. If this doesn't work you will need to follow the standard MariaDB instructions for resetting the `root` password.

If you're using the `root` user to create a database for a WordPress installation, it's easier to use the custom site template which will create the database for you.

### External Client Connections

For external MySQL clients  you need to use the `external` user:

| Field    	| Value    	|
|----------	|----------	|
| host     	| vvv.test 	|
| username 	| external 	|
| password 	| external 	|

---

See: [Connecting to MariaDB/MySQL](sql-client.md) from your local machine for more information

##  Default WordPress Login

By default, the site templates use the following username and password unless specified:

| Field    	| Value    	|
|----------	|----------	|
| username 	| admin 	|
| password 	| password 	|

## The Root User

Vagrant Box Ubuntu Root:

| Field    	| Value    	|
|----------	|----------	|
| username 	| root 	|
| password 	| vagrant 	|

**Note that it is not possible to SSH directly into the VM as `root` for security reasons**. If you need to run commands as `root`, either use `sudo` or `sudo su`, both of which do not require a password when ran as the `vagrant` user

## SSH

You can SSH into the VM via the `vagrant` user with the command `vagrant ssh`. Running `vagrant ssh-config` will dump out an SSH config you can use to SSH directly into that VM without use of the `vagrant` command.

Otherwise it is enough to run this command:

```shell
ssh vagrant@vvv.test
```

| Field    	| Value    	|
|----------	|----------	|
| host 	| vvv.test 	|
| username 	| vagrant 	|

Note that no password is used.

