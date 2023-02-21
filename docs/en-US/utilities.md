---
category: 7. Extensions
order: 1
title: Utilities
description: Extensions are packages for VVV that install system level functionality. The core extensions package installs phpMyAdmin, webgrind, and other versions of PHP.
permalink: /docs/en-US/utilities/
---

Utilities are packages for VVV that install system level functionality. For example, a core utilities package is provided by default. This default utility can install phpMyAdmin, webgrind, and other versions of PHP.

Here are the default utilities as they would be defined in `config/config.yml` in full:

```yaml
extensions:
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
    #- php74
    #- php80
    #- php81
    #etc...

extension-sources:
  core:
    repo: https://github.com/Varying-Vagrant-Vagrants/vvv-utilities.git
    branch: master
```

UtilExtensions are defined at the end of the file, outside of the sites section. The `extension-sources` section defines the name of an extension and where it can be found.

## Adding Extensions

Lets say that I want to run Java 7 inside a VVV installation. In order to install java, I'll need an extension. Lets name it `java` and include it:

```yaml
extensions:
  core:
    - php81
  java:
    - java7
extension-sources:
  java:
    repo: https://github.com/example/java-utilities.git
    branch: master
```

My *hypothetical* extension defines how to install different versions of Java, and is located in a git repository. I might have defined how to install java 8, or java 6, but here I used java 7.

## How Extension Repositories Are Structured

An extension git repo contains folders, and each folder has a provisioner script inside.

With this in mind, I would expect the java repository mentioned earlier to have this folder structure:

 - `java6/`
   - `provision.sh`
 - `java7/`
   - `provision.sh`
 - `java8/`
   - `provision.sh`
 - `readme.md`

The name of the subfolder maps directly on to what is put in `config/config.yml`. VVV will run the `provision.sh` file, at which point it can do as it pleases. This could be installing a package via `apt-get` or something else. Other files can be included in these folders for `provision.sh` to make use of.

## Extension Provisioning

It's possible to provision a single extension on its own, without provisioning the whole of VVV using the `--provision-with` parameter of vagrant.  
As an example from the `config/config.yml` above, we can run `vagrant provision --provision-with="extension-core-php81"` to provision only the PHP 8.1 extension.

Important: To work this command requires that the extension is also enabled in the `config/config.yml` file, it won't add it automatically.

## Community Extension

Community extensions are independently developed and contributed by interested members of the community, provided on an 'as is' basis.


* **VVV Wordmove Extension**: Installs Wordmove (and Ruby).  
  [https://github.com/welaika/vvv-wordmove/](https://github.com/welaika/vvv-wordmove/)
* **VVV Solr Extensions**: Installs Solr and Java.  
  [https://github.com/ocean90/vvv-solr-utilities](https://github.com/ocean90/vvv-solr-utilities)
* **VVV GMP Extension**: Installs GMP.
  [https://github.com/denisyilmaz/vvv-gmp-utility](https://github.com/denisyilmaz/vvv-gmp-utility)
* **VVV Browscap Extension**: Installs browscap module for PHP.  
  [https://github.com/dingo-d/browscap-vvv-utility](https://github.com/dingo-d/browscap-vvv-utility)
* **VVV Redis Extension**: Installs Redis.
  [https://github.com/dingo-d/redis-vvv-utility](https://github.com/dingo-d/redis-vvv-utility)
* **VVV php-ldap Extension**: Installs php-ldap.
  [https://github.com/olipayne/vvv-php-ldap](https://github.com/olipayne/vvv-php-ldap)
