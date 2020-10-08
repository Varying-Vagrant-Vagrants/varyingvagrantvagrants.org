---
category: 7. Utilities
order: 1
title: Utilities
description: Utilities are packages for VVV that install system level functionality. The core utilities package installs phpMyAdmin, webgrind, and other versions of PHP.
permalink: /docs/en-US/utilities/
---

Utilities are packages for VVV that install system level functionality. For example, a core utilities package is provided by default. This default utility can install phpMyAdmin, webgrind, and other versions of PHP.

Here are the default utilities as they would be defined in `vvv-custom.yml` in full:

```YAML
utilities:
  core:
    - memcached-admin # Object cache management
    - opcache-status # opcache management
    - phpmyadmin # Web based database client
    - webgrind # PHP Debugging
    - tls-ca # SSL/TLS certificates
    - mongodb # needed for Tideways/XHGui
    - tideways # PHP profiling tool, also installs xhgui
    - wpcli-dev # Install a dev environment to use and contribute to WP-CLI
    - php # Install all the php utilities available automatically
    #- php56
    #- php70
    #- php71
    #- php72
    #- php73

utility-sources:
  core:
    repo: https://github.com/Varying-Vagrant-Vagrants/vvv-utilities.git
    branch: master
```

Utilities are defined at the end of the file, outside of the sites section. The `utility-sources` section defines the name of a utility and where it can be found.

## Adding Utilities

Lets say that I want to run Java 7 inside a VVV installation. In order to install java, I'll need a utility. Lets name it `java` and include it:

```YAML
utilities:
  core:
    - php56
  java:
    - java7
utility-sources:
  java:
    repo: https://github.com/example/java-utilities.git
    branch: master
```

My hypothetical utility defines how to install different versions of Java, and is located in a git repository. I might have defined how to install java 8, or java 6, but here I used java 7.

## How Utility Repositories Are Structured

A utility repo contains folders, and each folder has a provisioner script inside.

With this in mind, I would expect the java repository mentioned earlier to have this folder structure:

 - java6/
   - provision.sh
 - java7/
   - provision.sh
 - java8/
   - provision.sh
 - readme.md

The name of the subfolder maps directly on to what is put in `vvv-custom.yml`. VVV will run the `provision.sh` file, at which point it can do as it pleases. This could be installing a package via `apt-get` or something else. Other files can be included in these folders for `provision.sh` to make use of.

## Utility Provisioning

It's possible to provision a single utility on its own, without provisioning the whole of VVV using the `--provision-with` parameter of vagrant.  
As an example from the `config.yml` above we can run `vagrant provision --provision-with="utility-core-php56"` to provision only the PHP 5.6 utility.  
To work this command requires that the utility is enabled in the `config.yml` file, it won't add it automatically.

## Community Utilities

Community utilities are independently developed and contributed by interested members of the community, provided on an 'as is' basis.


* **VVV Wordmove Utility**: Installs Wordmove (and Ruby).  
  [https://github.com/welaika/vvv-wordmove/](https://github.com/welaika/vvv-wordmove/)

* **VVV Solr Utilities**: Installs Solr and Java.  
  [https://github.com/ocean90/vvv-solr-utilities](https://github.com/ocean90/vvv-solr-utilities)
  
* **VVV GMP Utility**: Installs GMP.
  [https://github.com/denisyilmaz/vvv-gmp-utility](https://github.com/denisyilmaz/vvv-gmp-utility)
  
* **VVV Browscap Utility**: Installs browscap module for PHP.  
  [https://github.com/dingo-d/browscap-vvv-utility](https://github.com/dingo-d/browscap-vvv-utility)
  
* **VVV Redis Utility**: Installs Redis.
  [https://github.com/dingo-d/redis-vvv-utility](https://github.com/dingo-d/redis-vvv-utility)
  
* **VVV php-ldap Utility**: Installs php-ldap.
  [https://github.com/olipayne/vvv-php-ldap](https://github.com/olipayne/vvv-php-ldap)
