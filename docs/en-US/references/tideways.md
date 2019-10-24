---
category: 6. Reference
order: 2
title: Tideways and XHGui
permalink: /docs/en-US/references/tideways-xhgui/
---

VVV has different utilities available for developers, one of them is [Tideways](https://github.com/tideways/php-xhprof-extension) (open source version) that is an optional tool, here's what their website has to say about it's features:

> Tideways saves you time by taking the guesswork out of your app's backend performance. Gain detailed insights, spot performance bottlenecks, and get real-time error detection alerts.

## Suite

Tideways is a PHP module for PHP 7.0+ that enable to profile everything happened in the page.
To use it is required to execute specific PHP code that gather this data and also visualize them.
We added [XHGui](https://github.com/perftools/xhgui) that is a graphical interface for Tideways that is a complete tool to analyze this data.

## How to enable it

XHGui need a php file that is prepended to all of them (by a global php config) to turn on the profiling and save this information.

XHGui will be executed in headless mode if Tideways is available for the PHP version used in the website that you are profiling.

To profile a page you need to enable the tideways module and disable xDebug, you can do it running the `xdebug_off` command inside the Vagrant machine (in this way xDebug is turned off but Tidewyas is turned on).

Now Tideways is globally enabled and you can enable it in 2 ways:

* Specific URL: Add `?enable-tideways=1` to your URL
* For the domain: Create a new parameter `tideways: true` in your `config.yml` and run a provision, like:

```yaml
sites:
  wordpress-default:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    tideways: true
```

Later you can check to `xhgui.vvv.test` the result from profiling.
The provisioning will generate a file with all the domains enabled in `/srv/config/tideways.json`.

## Our custom implementation

To improve the data quality we added the support to not execute `Query Monitor` plugin when Tideways is enabled.
Also we implemented the support for a custom PHP `custom-header.php` file in `VVV/www/default/xhgui/config` that will be prepended in case it is avalaible.

We added the support for a custom config file `custom-config.php` in the same folder that can change the values of XHGui that will be merged with the VVV default. This can be helpful to filter via other methods, such as from the list like from specific plugins and so on.

## XHGui
There are already a lot of guides about XHGui:

  * [https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-2](https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-2)
  * [https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-3](https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-3)
