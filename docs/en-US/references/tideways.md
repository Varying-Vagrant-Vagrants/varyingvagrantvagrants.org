---
category: 6. Reference
order: 2
title: Tideways and XHGui
permalink: /docs/en-US/references/tideways-xhgui/
---

VVV has different utilities available for developers, one of them is [Tideways](https://github.com/tideways/php-xhprof-extension) (open source version) and is an optional tool described on their website as:

> Tideways saves you time by taking the guesswork out of your app's backend performance. Gain detailed insights, spot performance bottlenecks, and get real-time error detection alerts.

## Suite

Tideways is a PHP module for PHP 7.0+ that enables profiling everything that happens in a page.
One must execute specific PHP code to use Tideways, this code gathers data and visualizes it.
We added [XHGui](https://github.com/perftools/xhgui),a graphical interface for Tideways, that provides a complete ability to analyze the gathered data.

## How to enable it

XHGui needs a php file that is prepended to all PHP files (by a global php config) to turn on the profiling and save this information.

XHGui will be executed in headless mode if Tideways is available for the PHP version used in the website that you are profiling.

To make Tideways and XHGui work, you need to make sure `tideways` is added to the utilities in your `config.yml`:

```yaml
utilities:
  core: # The core VVV utility
    - tideways # PHP profiling tool, also installs XHGui
```

To profile a page you need to enable the Tideways module and disable xDebug. This can be done by running the `xdebug_off` command inside the Vagrant machine (this turns xDebug off and ensures Tideways is turned on).

Now Tideways is globally enabled and you can enable it in 2 ways:

* Specific URL: Add `?enable-tideways=1` to your URL
* For the domain: Create a new parameter `tideways: true` in your `config.yml` and run a provision, like:

```yaml
sites:
  wordpress-default:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    tideways: true
```

Later you can check `xhgui.vvv.test` for the result of the profiling.
The provisioning will generate a file with all the domains enabled in `/srv/config/tideways.json`.

## Our custom implementation

To improve the data quality we added support to suspend `Query Monitor` plugin activities when Tideways is enabled.
We also implemented support for a custom PHP `custom-header.php` file in `VVV/www/default/xhgui/config` that will be prepended if it is avalaible.

We added support for a custom config file `custom-config.php` in the same folder that can change the values of XHGui that will be merged with the VVV default. This can be helpful to filter via other methods, such as from the list like from specific plugins and so on.

## XHGui
There are already a lot of guides about XHGui:

  * [https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-2](https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-2)
  * [https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-3](https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-3)
