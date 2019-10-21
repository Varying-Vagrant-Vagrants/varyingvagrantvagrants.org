---
category: 8. TLS and HTTPS
order: 3
title: Setting Up Site Templates
description: Setting up site templates to use https
permalink: /docs/en-US/https/site-templates/
---

To get a site template working with https, we need to do 2 things:

 - tell Nginx to use the new certificate
 - use https in the provisioner script

### Adjusting the Provisioner Script

Most provisioner scripts will be fine, but if they specify the URL that gets used, they should use `https` specifically. Additionally, they should also specify `define('FORCE_SSL_ADMIN', true);` in `wp-config.php`, though this isn't necessary.

Keep in mind that just because VVV is capable of serving via HTTPS, doesn't mean the software is going to make use of it. Existing sites installed via `http://` will need to be told their site url should contain `https://`, and the database search replaced to swap links in post content for `https` versions.

If you've reached that point however, then any generic instructions for migrating will work, no further steps are needed for VVV.

### Adjusting Nginx

Non-official site templates will need to adjust their `vvv-nginx.conf` to reference the certificates. Certificates are stored in a `certificates` subfolder of the VVV install, available in the VM at `/vagrant/certificates/`. Each site has a subfolder, with a `dev.key` and a `dev.crt`.

For example, a site named `example`, will have the following files:

 - `/vagrant/certificates/example/dev.key`
 - `/vagrant/certificates/example/dev.crt`

If you can load `readme.html` over `https` via VVV then you've finished the VVV part of setup.
