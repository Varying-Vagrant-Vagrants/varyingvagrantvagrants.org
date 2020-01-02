---
category: 3. Adding a New Site
order: 5
title: Custom Nginx Configs
description: How to configure a custom Nginx config file for a site.
permalink: /docs/en-US/adding-a-new-site/custom-nginx/
---

By default, VVV copies a `vvv-nginx.conf` file into place. The site templates create this by modifying a `vvv-nginx-default.conf` file and renaming it. If you want to use a custom nginx file, create a `vvv-nginx-custom.conf` file and this will be used instead.

This is useful if you wish to implement or change Nginx rules. For example, using a subdirectory installation of WordPress.

It may also be necessary to replace the nginx wp common rules. VVV does this using an include statement, but you could replace this with the contents of that file. It can be found in `config/nginx-config/nginx-wp-common.conf`. Note that VVV will only copy the final Nginx config file, it won't copy over includes.

## About the Nginx generation

```Nginx
  root {vvv_path_to_site}/public_html;
```

`{vvv_path_to_site}` gets replaced with the location of your site, and to change to `htdocs`, simply replace `public_html` with `htdocs`, save, then reprovision. Likewise, you can go deeper down if your git repository has a more complex structure.


```Nginx
  set          $upstream {upstream};
```

`{upstream}` gets replaced with the php version that this domain will use.

```Nginx
  {{LIVE_URL}}
```

In case the `live_url` parameter is set as defined in the [provisioner readme](https://github.com/Varying-Vagrant-Vagrants/custom-site-template) will add support for redirects any uploads not found locally to this domain.
