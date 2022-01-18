---
category: 6. Reference
order: 2
title: Tideways and XHGui
permalink: /docs/en-US/references/tideways-xhgui/
---

VVV has different utilities available for developers, one of them is [Tideways](https://github.com/tideways/php-xhprof-extension) (open source version) and is an optional tool described on their website as:

> Tideways saves you time by taking the guesswork out of your app's backend performance. Gain detailed insights, spot performance bottlenecks, and get real-time error detection alerts.

## What Is It?

Tideways is a PHP module for PHP 7.0+ that enables profiling everything that happens in a page.
One must execute specific PHP code to use Tideways, this code gathers data and visualizes it.
We added [XHGui](https://github.com/perftools/xhgui),a graphical interface for Tideways, that provides a complete ability to analyze the gathered data.

## Installing Tideways

By default VVV does not install Tideways to keep the VM lightweight, but if you look for this line in `config/config.yml`:

```yml
    #- tideways # PHP profiling tool, also installs xhgui check https://varyingvagrantvagrants.org/docs/en-US/references/tideways-xhgui/
```

And remove the comment so it looks like this:

```yml
    - tideways # PHP profiling tool, also installs xhgui check https://varyingvagrantvagrants.org/docs/en-US/references/tideways-xhgui/
```

Then Tideways will be installed when you reprovision using `vagrant up --provision`

## How To Enable Tideways

To make Tideways and XHGui work, you need to make sure `tideways` is added to the utilities in your `config.yml` for example:

```yaml
utilities:
  core: # The core VVV utility
    - tideways # PHP profiling tool, also installs XHGui
```

To enable tideways, SSH into the VM and run `tideways_on`. This will turn off XDebug and turn on Tideways. Turning on XDebug will turn off tideways as the two cannot run at the same time. You can also use `tideways_off` to disable Tideways.

## How To Profile A Page

You can profile a page with tideways by adding `?enable-tideways=1` to the URL.

## Profiling All Pages On A Site

Create a new parameter `tideways: true` in your `config.yml` and reprovision. Now all pages on that sites domains will be profiled automatically if Tideways is turned on the machine with the command `tideways_on`.
As per xDebug it is required the module to be loaded so you need to execute `tideways_[on/off]` based on your needs. This let you to turn on xDebug and off Tideways (not enable both).

For example:

```yaml
sites:
  wordpress-one:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    tideways: true
    hosts:
      - one.wordpress.test
```

Now after reprovisioning, all requests to one.wordpress.test will be profiled and appear in XHGui.

## Viewing Profile Results

To see the results of profiling, visit `http://xhgui.vvv.test` where you will find an install of XHGui.

### How To Use XHGui

Here are some guides on using XHGui:

  * [https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-2](https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-2)
  * [https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-3](https://www.engineyard.com/blog/profiling-with-xhprof-xhgui-part-3)


## Our custom implementation

To improve the data quality we added support to suspend `Query Monitor` plugin activities when Tideways is enabled.
We also implemented support for a custom PHP `custom-header.php` file in `VVV/www/default/xhgui/config` that will be prepended if it is available.

We added support for a custom config file `custom-config.php` in the same folder that can change the values of XHGui that will be merged with the VVV default. This can be helpful to filter via other methods, such as from the list like from specific plugins and so on.

