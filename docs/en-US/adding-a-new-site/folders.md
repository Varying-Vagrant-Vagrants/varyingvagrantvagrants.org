---
category: 3. Adding a New Site
order: 4
title: Sub-Folders and Custom Git Checkouts
description: Cloning git repositories and other folder options for a site
permalink: /docs/en-US/adding-a-new-site/folders-and-custom-git/
---

Additional software can be installed via `git` by using the `folders` parameter of a site. This lets you specify a subfolder, and clone a git repository into it. VVV can also keep that repository up to date. _This feature requires VVV 3.5.1 or higher._

For example, here is a WP VIP site, with a platform plugin cloned into place and updated, and a custom `wp-content` folder:

```yaml
  vip:
    repo: https://github.com/Varying-Vagrant-Vagrants/custom-site-template.git
    hosts:
      - vip.test
    folders:
      public_html/wp-content/:
        git:
          repo: https://github.com/Automattic/vip-go-skeleton.git
          overwrite_on_clone: true
      public_html/wp-content/mu-plugins:
        git:
          repo: https://github.com/Automattic/vip-go-mu-plugins.git
          overwrite_on_clone: true
          hard_reset: true
          pull: true
```

Each sub-key is a path relative to the sites location. The `git` parameter takes the following keys:

 - `repo:` A valid git URI to clone. VVV will not update a repository if you change this value
 - `overwrite_on_clone:` true or false, if the target folder already exists and is not a git repo, should VVV delete it and clone? If false, VVV will stop provisioning if the target already exists
 - `pull:` true or false, should VVV run `git pull` on provision?
 - `hard_reset:` true or false, should VVV discard all changes in the git repository on reprovision?
 
Each subfolder is processed in the order defined in the config file. Currently clones are recursive. Private repositories require that the host machine has configured SSH access to GitHub, and that SSH agent forwarding is available.
