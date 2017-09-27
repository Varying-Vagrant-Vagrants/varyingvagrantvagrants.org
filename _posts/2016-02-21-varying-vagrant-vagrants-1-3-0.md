---
layout: default
title:  "Varying Vagrant Vagrants 1.3.0"
date:   2016-02-21 11:47:00 -0900
author: jeremyfelt
---

Howdy!

It's time for another <em>official</em> release. <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/releases/tag/1.3.0">VVV 1.3.0</a> has been tested and tagged and is waiting for you to grab it up. To read about all of the great things that make up this release, head over to the <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/blob/1.3.0/CHANGELOG.md">full changelog</a> on GitHub.
<h3>A handful of highlights</h3>
Support for several new providers has been added. While VirtualBox is the most widely supported, we now account for Parallels, VMWare Fusion, VMWare Workstation, and Hyper-V in the default Vagrantfile. This is especially useful if you're already using one of those to manage other virtual machines.

<a href="http://mailcatcher.me/">MailCatcher</a> is now included as part of provisioning. An inbox view is available at <code>vvv.dev:1080</code> to show you all of the mail sent by the virtual machine. This has been super helpful in troubleshooting issues with emails sent by core and plugins.

The WordPress core SVN repositories are now set to HTTPS. If these directories were originally provisioned as part of an old VVV configuration, it's possible that things like <code>svn up</code> will show an error. You can use the <code>svn relocate</code> command to change the repository to the HTTPS URL. See <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/561">issue 561</a> for more information. We'll have a proper FAQ up to handle this at some point.
<h3>What's next?</h3>
If I was going to phrase up the next year of VVV, I would say: Slow and steady with more minor releases.

A tough thing about marking version numbers on a project like VVV is that all of the various versions of included packages change frequently. We need to do a better job of making it easier to maintain existing packages. I'd like to encourage more people to use the <code>develop</code> branch on GitHub and at the same time release more incremental versions. I'm going to start planning on a release every 3 months. We'll see how that works and take it from there.
<h4>Major things I'd like to see</h4>
Update packages on <code>vagrant provision</code>, rather than only installing the first time. This should make <code>vagrant provision</code> a more common part of your daily workflow, used to keep things like PHP, Nginx, and MySQL updated.

Make it easy to remove default configurations. I think the <a href="https://github.com/bradp/vv">Variable VVV project</a> is an excellent way to add projects to VVV. We need a nice and simple way to turn off the default WordPress local, trunk, and dev environments provided by VVV.

Improved documentation. I'd like to follow the example of projects like <a href="http://wp-cli.org/">WP-CLI</a>, which has excellent documentation available in a nice, browsable format. Our GitHub wiki has a bunch of great information, but we can do better.
<h4>And be ready for...</h4>
A PHP upgrade. We're sadly still on PHP 5.5.x and we should at least be on PHP 5.6.x if not PHP 7. Please leave feedback on <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/834">issue #834</a> if you have a preference.

A switch in default domain names. Our <code>domain.dev</code> pattern is quickly looking like it will cause more issues with name collisions. Pay attention to <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/583">issue #583</a> as we'll use that to switch to <code>domain.test</code> or <code>domain.localhost</code> instead.

And that's it. Thanks to all of our <a href="https://github.com/Varying-Vagrant-Vagrants/VVV#varying-vagrant-vagrants">amazing contributors</a> and thanks to everyone for using VVV!
