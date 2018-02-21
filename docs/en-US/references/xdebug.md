---
category: 6. Reference
order: 2
title: XDebug
permalink: /docs/en-US/references/xdebug/
---

VVV installs the XDebug extension, a useful tool for development, here's what their website has to say about it's features:

> Xdebug is an extension for PHP to assist with debugging and development. It contains a [single step debugger](https://xdebug.org/docs/remote) to use with IDEs; it upgrades PHP's [`var_dump()`](https://xdebug.org/docs/display) function; it adds [stack traces](https://xdebug.org/docs/stack_trace) for Notices, Warnings, Errors and Exceptions; it features functionality for [recording every function call and variable assignment](https://xdebug.org/docs/execute_trace') to disk; it contains a [profiler](https://xdebug.org/docs/profiler); and it provides [code coverage](https://xdebug.org/docs/code_coverage) functionality for use with [PHPUnit](https://phpunit.de/).

## Turning XDebug On and Off

XDebug is turned off by default, but you can turn it on by SSH'ing into VVV with `vagrant ssh`, and running the command `xdebug_on`. You can turn it off by running `xdebug_off`. Keep in mind that some commands such as `composer` will run much slower with XDebug turned on.


Once XDebug is turned on, it will remain on until the next time VVV is provisioned
