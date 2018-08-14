---
category: 8. TLS and HTTPS
order: 1
title: Setting Up HTTPS
description: Setting up https with VVV's built in certificate authority
permalink: /docs/en-US/references/https/
---

To use `https://` URLs you need to generate certificates, luckily VVV has you covered.

## Setting up the Certificate Authority

Using VVV 2.2+ ( switch to `develop` branch if it hasn't been released yet ), add `tls-ca` as a utility under `core`, like this in your `vvv-custom.yml` file:

```YAML
utilities:
  core:
    - memcached-admin
    - opcache-status
    - phpmyadmin
    - webgrind
    - trusted-hosts
    - tls-ca
```

Then, reprovision `vagrant reload --provision`. When this finishes, every site using the `custom-site-template` or `wordpress-develop` will have a certificate and support `https`.

Visit your site with `https`, and you'll notice that the first time it loads, the browser will complain about an invalid certificate authority. Skip this screen, and it should never show again. This should happen for each new site. See the section below, on accepting a certificate authority to prevent this from happening.

*Note:* `wordpress-default` is deprecated, switch to `custom-site-template` or create an additional site using the custom site template.
