---
category: 6. Reference
order: 2
title: Xdebug
permalink: /docs/en-US/references/xdebug/
---

VVV installs the Xdebug extension, a useful tool for development, here's how their website describes it:

> Xdebug is an extension for PHP to assist with debugging and development. It contains a [single step debugger](https://xdebug.org/docs/remote) to use with IDEs; it upgrades PHP's [`var_dump()`](https://xdebug.org/docs/display) function; it adds [stack traces](https://xdebug.org/docs/stack_trace) for Notices, Warnings, Errors and Exceptions; it features functionality for [recording every function call and variable assignment](https://xdebug.org/docs/execution_trace) to disk; it contains a [profiler](https://xdebug.org/docs/profiler); and it provides [code coverage](https://xdebug.org/docs/code_coverage) functionality for use with [PHPUnit](https://phpunit.de/).

## Turning Xdebug On and Off

```shell
vagrant ssh -c "switch_php_debugmod xdebug"
```

Xdebug is turned off by default, but you can turn it on by SSH'ing into VVV with `vagrant ssh`, and running the command `switch_php_debugmod xdebug`. You can turn it off by running `switch_php_debugmod none`. Keep in mind that some commands such as `composer` will run slower with Xdebug turned on.


Once Xdebug is turned on, it will remain on until the next time VVV is provisioned.

## Connecting Your IDE to Xdebug


### Generic Instructions

Here are some general guidelines on connecting:

 - Configure your IDE to connect to `vvv.test`.
 - User the default Xdebug port ( `9003` at the time of writing ).
 - The PHP Info page will show an Xdebug info section with connection checks, use the PHP Info button in the dashboard tools section.
 - The IDEKEY shouldn't be necessary, but we set it to `VVVDEBUG`.
 - Map the `www` subfolder on to `/srv/www`.
 - Xdebug will be in step debugging mode.
 - Reprovisioning turns off Xdebug to speed up provisioning, you will need to turn it back on.
 - There is an Xdebug remote log in the `log/php/xdebug-remote.log` file.
 - Xdebug will try to connect to your host machine automatically, so set your IDE to listen for connnections if that option is available

### VSCode

VVV 3.6 and above includes a `.vscode/launch.json` preconfigured for Xdebug named `VVV Listen for Xdebug`. [You will need to install the PHP Debug extension](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug). Turn on Xdebug, and begin a debugging session in VSCode.
