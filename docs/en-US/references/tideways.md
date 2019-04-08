---
category: 6. Reference
order: 2
title: Tideways and XHGui
permalink: /docs/en-US/references/tideways-xhgui/
---

VVV has different utilities available for developers, one of them is [Tideways](https://github.com/tideways/php-xhprof-extension) (open source version) that is an optional tool, here's what their website has to say about it's features:

> Tideways saves you time by taking the guesswork out of your app's backend performance. Gain detailed insights, spot performance bottlenecks, and get real-time error detection alerts. 

## Suite

Tideways is a module for PHP 7.0+ that enable to profile everything happened in the page.  
Without any implementation by PHP code is not possible to analyze and study the data from the page.  
For this reason we added also [XHGui](https://github.com/perftools/xhgui) that is a graphical interface for Tideways that is a complete tool to analyze data.  

## How to enable it

XHGui need a php file that is prepended to all of them to turn on the profiling and save the data.  
If Tideways is available for the PHP version used by the website that you are profiling.  
To profile a page add `?enable-tideways` to your URL and check to `xhgui.vvv.test` the result from profile.

## Our custom implementation

To improve the data gathering we added the support to not execute `Query Monitor` plugin when Tideways is enabled.  
Also we implemented the support for a custom PHP `custom-header.php` file in `VVV/www/default/xhgui/config` that will be prepended in case it is avalaible.  
We added the support for a custom config file that can change the values of XHGui that will be merged with the fault 

## XHGui
There are already a lot of guides about XHGui:

  * [https://engineyard.com/blog/profiling-with-xhprof-xhgui-part-2](https://engineyard.com/blog/profiling-with-xhprof-xhgui-part-2)
  * [https://engineyard.com/blog/profiling-with-xhprof-xhgui-part-3](https://engineyard.com/blog/profiling-with-xhprof-xhgui-part-3)
