---
layout: default
title:  "Varying Vagrant Vagrants 1.2.0"
date:   2014-12-14 23:00:00 -0900
---

Well hello. We're finally here.

After a long 9 months of waiting, it's a happy moment to push a <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/releases/tag/1.2.0">tagged 1.2.0 release of Varying Vagrant Vagrants</a>.

A full list of changes is available in the <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/blob/stable/CHANGELOG.md">changelog</a>. Here are some important ones.

First, VVV is now <a href="https://github.com/varying-vagrant-vagrants/vvv/blob/stable/LICENSE">MIT Licensed</a>. This is a big deal and we waited entirely too long as an open source project before choosing one. In fact, you could say we weren't really an open source project at all until that point. Many many thanks to the <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/346">near 50 contributors who were there to confirm</a> their previous contributions as MIT so that we could proceed.

If there's any lesson I learned from this, it's to start with a license before anything else.

Ok, next. In new instances of VVV 1.2.0, <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/pull/322">database files are no longer mapped</a> to a persistent local location. The database is entirely contained inside the virtual machine. What does this mean?
<ul class="task-list">
 	<li>A full <code>vagrant destroy</code> and the removal of MySQL data from <code>{vvv-dir}/database/data/</code> is <strong>recommended</strong>. While not necessary, this will keep a clean workflow in the future.</li>
 	<li>If database files already exist from an earlier version of VVV, data will continue to be mapped locally until removed. This is our attempt at backward compatibility. Anybody currently running VVV 1.1 may not even notice the change.</li>
 	<li>Even when not persistent locally, database data will continue to exist on the virtual machine through <code>vagrant halt</code> and <code>vagrant suspend</code>. This is the same behavior as a production server. You can restart the machine and the data remains.</li>
 	<li>Database data will no longer exist on the virtual machine after <code>vagrant destroy</code>. This is the same as reformatting a production server. At this point, the intention should be to start fresh or to restore from a backup.</li>
 	<li>A <code>db_backup</code> script is provided by default that creates local backups of each database on halt, suspend, and destroy if the vagrant-triggers plugin is installed. This is the current workflow, though we'll be taking steps to reduce the number of backups created in the future as well.</li>
</ul>
Somewhat more impactful is the <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/334">change in operating system</a> from Ubunto 12.04 LTS 32bit to 14.04 LTS 64bit. To upgrade from 1.1 to 1.2.0, a full <code>vagrant destroy</code> is likely necessary for best results. As mentioned above, your database data will be remain as it only becomes non-persistent on new instances of VVV and by choice on upgrade.
<ul>
 	<li>A new box will be downloaded for the base virtual machine. If you'd like to free space on your local machine, remove the old box with <code>vagrant box remove precise32</code>. Running <code>vagrant box list</code> will show you all base VMs on your local machine.</li>
 	<li>With a new operating system comes a new RSA key. If you are connecting via SSH through an application that relies on your machines <code>known_hosts</code> file, you will need to clear the old key for 192.168.50.4. <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/365">See #365</a></li>
 	<li>I ran through the process of a 1.1 to 1.2.0 upgrade and <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/510#issuecomment-64097274">left notes in this comment</a>.</li>
</ul>
And other changes of note:
<ul>
 	<li>A <code>develop_git</code> script is available inside the virtual machine to convert the default SVN WordPress checkouts to Git. With core accepting patches via pull request in the near future, this may be useful to some.</li>
 	<li>We're now tracking Nginx mainline, so expect that to be at the most current version during any provision.</li>
</ul>
And now the future! We have plenty of open issues and many goals to keep us busy, and I'm always interested in hearing new ideas for how VVV can best be used. Here's what's on the front burner.
<ul>
 	<li>Allow the selection of which sites to make active by default (See <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/474">#474</a>, <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/313">#313</a>, <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/210">#210</a>). It's great that we provide a handful of different WordPress instances by default, but it would sure be nice to disable the ones you don't use or to enable others you'd like to use. It would be really nice to separate some of the default configurations out into their own init scripts, similar to what <a href="http://www.foellmann.de/christian/">Christian Foellmann</a> has been working on in the <a href="https://github.com/Varying-Vagrant-Vagrants/vvv-multisite">new VVV multisite repository</a>. This will also help out with projects like the <a href="https://github.com/iandunn/wordpress-meta-environment">WordPress Meta Environment</a>, which really don't need the default sites at all.</li>
 	<li>And in the process of doing the above, provide some sort of configuration file. YAML seems easy, but eyes and ears are wide open for the best approach on this.</li>
 	<li>Now that we've worked out a license, we should work out what versioning really means to us. I would happily move to semantic versioning—hinted at with this release number—though it would be nice to cover thoughts on that. It would also be nice to work out a proper release schedule, so that we aren't all waiting 9 months for the next one. :)</li>
</ul>
That's it, go get VVV 1.2.0 and have some fun. Thank you so much to the <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/blob/stable/README.md">many, many contributors</a> that have made VVV what it is today. And stop in with any questions, all are welcome!
