# varyingvagrantvagrants.org

[![Build Status](https://travis-ci.org/Varying-Vagrant-Vagrants/varyingvagrantvagrants.org.svg?branch=master)](https://travis-ci.org/Varying-Vagrant-Vagrants/varyingvagrantvagrants.org) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/84e6230107ec4970af18a9d43b418a60)](https://www.codacy.com/gh/Varying-Vagrant-Vagrants/varyingvagrantvagrants.org?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Varying-Vagrant-Vagrants/varyingvagrantvagrants.org&amp;utm_campaign=Badge_Grade)

This repository provides the code and content for [varyingvagrantvagrants.org](https://varyingvagrantvagrants.org), [VVV](https://github.com/Varying-Vagrant-Vagrants/vvv)'s official website.

The `main` branch of this repository deploys to production under [varyingvagrantvagrants.org](https://varyingvagrantvagrants.org). It also pulls the [CONTRIBUTING.md](https://github.com/Varying-Vagrant-Vagrants/VVV/blob/develop/.github/CONTRIBUTING.md) and [CHANGELOG.md](https://github.com/Varying-Vagrant-Vagrants/VVV/blob/develop/CHANGELOG.md) files from the `develop` branch of [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).

Pull requests can be opened against this repository for the following:

* Issues with deployment configuration through Travis CI.
* Issues with Jekyll configuration.
* Updates to the varyingvagrantvagrants.org home page.
* Updates to varyingvagrantvagrants.org blog posts.
* Updates to VVV documentation.

Once a pull request is merged to `master`, Travis CI is used to deploy the built site files to an AWS S3 bucket. Nginx is used to direct traffic to the correct branch directory in the bucket.

Issues to discuss changes to the code and documentation should be opened at the main [VVV repository](https://github.com/Varying-Vagrant-Vagrants/vvv).

## Testing and Building

Use this command to run a local instance for writing docs:

```sh
bundle exec jekyll serve
```

It will give you a URL to visit in your browser, and rebuilds the docs and stylesheets when files change.

The site is auto-deployed by Travis when the `main` branch is updated.
