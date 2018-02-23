---
category: 6. Reference
order: 4
title: HTTPS
description: Setting up https with VVV's built in certificate authority
permalink: /docs/en-US/references/https/
---

To use `https://` URLs you need to generate certificates, luckily VVV has you covered.

## Setting up the Certificate Authority

Using VVV 2.2+ ( switch to `develop` branch if it hasn't been released yet ), then add `tls-ca` as a utility under `core`, like this:

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

Now, reprovision `vagrant reload --provision`. When this finishes, every site using the `custom-site-template` or `wordpress-develop` will have a certificate and support `https`.

Visit your site with `https`, and you'll notice that the first time it loads, the browser will complain about an invalid certificate authority. Skip this screen, and it should never show again. This should happen for each new site. See the section below, on accepting a certificate authority to prevent this from happening.

*Note:* `wordpress-default` is deprecated, switch to `custom-site-template` or create an additional site using the custom site template.

### Adjusting Site Templates

Non-official site templates will need to adjust their `vvv-nginx.conf` to reference the certificates. Certificates are stored in a `certificates` subfolder of the VVV install, available in the VM at `/vagrant/certificates/`. Each site has a subfolder, with a `dev.key` and a `dev.crt`.

For example, a site named `example`, will have the following files:

 - `/vagrant/certificates/example/dev.key`
 - `/vagrant/certificates/example/dev.crt`

## Adding a Certificate Authority Certificate

Once the main authority certificate is accepted, all certificates VVV generates will always be accepted. The details of how to do this will depend on your platform, but to do so you will need to know where the certificate is located.

You can find the central certificate in `certificates/ca/ca.crt`. There are some caveats though:

 - This only works for your instance of VVV, you cannot use this to generate certificates for other VVV users
 - This will only work on your machine, this cannot be used to generate an SSL certificate for a live website
 - This will never work for `.dev` domains, Google have preloaded Chrome with security policies, and Firefox has followed suit. These cannot be dismissed. Since the `.dev` TLD is owned and used by Google it isn't safe, switch to `.test` TLDs
