---
category: 3. Adding a New Site
order: 3
title: Custom Paths and Folders
description: VVV supports sites in a non-standard folder via the vm_dir and local_dir keys in the sites section of vvv-custom.yml.
permalink: /docs/en-US/adding-a-new-site/custom-paths-and-folders/
---

A site in a non-standard folder can still be used via the `vm_dir` and `local_dir` keys. `local_dir` tells VVV where the site is located on the host machine, and `vm_dir` tells VVV where the site is located inside the Virtual machine.

Note that when we say site, we mean the entire site folder, complete with `provision` `logs` and `public_html` subfolders.

For example, if we put our test sites in a subfolder, we can specify each site like this in the `sites` section:

```yaml
test-site-1:
  repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
  vm_dir: /srv/www/test-sites/test-site-1
  local_dir:  /Users/janesmith/vagrant-local/www/test-sites/test-site-1
  hosts:
    - testsite1.com

test-site-2:
  repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
  vm_dir: /srv/www/test-sites/test-site-2
  local_dir: /Users/janesmith/vagrant-local/www/test-sites/test-site-2
  hosts:
    - testsite2.com
```

In the above example, the `vm_dir` and `local_dir` point to the same folder (`vm_dir` needs to be an absolute path), however, this doesn’t have to be the case.

In this example, VVV is told to use a site stored outside of the main VVV folder, and mapped to an absolute path in the virtual machine:

```yaml
example-site:
  repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
  vm_dir: /srv/www/example-site
  local_dir: /Users/janesmith/Documents/example-site
  hosts:
    - examplesite.com
```

Remember that VVV will be expecting an entire site in that folder, not just a WordPress folder or a `wp-content` folder. For this reason the above examples use the custom site template.

### Custom Subfolder Mappings

You may want to map just the `wp-content` folder, or a theme folder. This is not supported by VVV, but it is possible.

To do this, you need to use a vagrant custom file in your site template. However, we do not provide support for users who do this, and it's assumed that if you do this that you are knowledgable with Vagrant. Having said that, adding synced folders isn't too difficult, and is documented in great detail on the official Vagrant docs.

Also keep in mind that adding mappings has a performance cost. Users of VVV 1 may remember this process, and to this day some users believe this was officially supported in VVV 1, but this has never been the case.
