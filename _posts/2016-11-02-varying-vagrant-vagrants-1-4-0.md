---
layout: default
title:  "Varying Vagrant Vagrants 1.4.0"
date:   2016-11-02 10:00:00 -0000
author: jeremyfelt
---

Hi! Welcome to the release post for <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/releases/tag/1.4.0">Varying Vagrant Vagrants 1.4.0</a>.

This release is packed with quite a bit of housekeeping. Let's get that out of the way and then do a preview of what's lined up for the future. You can also checkout the <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/blob/1.4.0/CHANGELOG.md">full changelog</a> for more details.

First, VVV is now provisioned with PHP 7.0. PHP is on it's 12th maintenance release after the initial stable 7.0, so there's not much reason to keep waiting. This is a great way to test your code to make sure it is PHP 7 compatible.

NodeJS and NPM are a lot more organized and are positioned in a way to help clarify how we handle things in the future. First, we've decided to provide the latest LTS release of NodeJS. At this time, that's 6.9.x, so that's what VVV ships with. However, NVM is also installed during provisioning. This provides developers an easy way to switch between versions of NodeJS to work with the varying requirements of different libraries.

The "old" WordPress trunk repository, `core.svn.wordpress.org`, is no longer checked out during initial provisioning. VVV was created before WordPress switched to `develop.svn.wordpress.org` as the canonical source for development, so we've maintained that link throughout. At this point, it's likely more confusing than anything else <strong>and</strong> adds more time to the provisioning process. If you have a current installation of VVV and make use of the `wordpress-trunk` directory, you'll want to manage updates manually with `svn up`.

Those are the highlights. Much more detail exists in the <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/blob/1.4.0/CHANGELOG.md">CHANGELOG</a>.

How about the future?

<h4>Releases</h4>

<blockquote>If I was going to phrase up the next year of VVV, I would say: Slow and steady with more minor releases.</blockquote>

I wrote the above in the <a href="https://varyingvagrantvagrants.org/blog/2016/02/21/varying-vagrant-vagrants-1-3-0.html">VVV 1.3.0 release post</a> back in February. It looks like about half was right—it was slow and steady, but there were no minor releases.

An ideal release schedule still looks to me like once a quarter, so I'm going to try and make that happen in 2017. Let's target January 9th and April 10th for the next releases and see what happens.

<h4>Documentation</h4>

In August, the varyingvagrantvagrants.org site was converted to use Jekyll instead of WordPress. This felt slightly strange, because I love WordPress, but it does provide an easily managed GitHub based workflow to our documentation. Over the next year I'd like to see much more organized documentation via the <a href="https://github.com/Varying-Vagrant-Vagrants/varyingvagrantvagrants.org">VVV docs repository</a>. Contributions to that are very much more than welcome!

<h4>New features</h4>

There are a few exciting tickets open right now that should shape VVV into something pretty cool. If all goes well in the next year, we should see the ability to <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/pull/980">switch PHP versions using PHPBrew</a>, <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/835">switch MySQL versions with MySQL Sandbox</a>, and have <strong>much</strong> more control over the sites included with VVV by <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/pull/980">splitting them out into their own repositories</a>.

That's everything for 1.4.0. Thanks so much to all of our <a href="https://github.com/Varying-Vagrant-Vagrants/VVV#varying-vagrant-vagrants">contributors</a> and thank you for using VVV!
