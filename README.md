# varyingvagrantvagrants.org

This repository provides the code and content for [varyingvagrantvagrants.org](https://varyingvagrantvagrants.org), [VVV](https://github.com/Varying-Vagrant-Vagrants/vvv)'s official website.

Multiple versions of documentation are maintained for VVV based on branch name.

* The `develop` branch of this repository deploys to production under [develop.varyingvagrantvagrants.org](https://develop.varyingvagrantvagrants.org). It also pulls the `docs/` directory from the `develop` branch of [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).
* The `master` branch of this repository deploys to production under [varyingvagrantvagrants.org](https://varyingvagrantvagrants.org). It also pulls the `docs/` directory from the `master` branch of [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).

Pull requests can be opened against this repository for the following:

* Issues with deployment configuration through Travis CI.
* Issues with Jekyll configuration.
* Updates to the varyingvagrantvagrants.org home page.
* Updates to varyingvagrantvagrants.org blog posts.

Updates to the documentation at [varyingvagrantvagrants.org/docs/en-US/](https://varyingvagrantvagrants.org/docs/en-US/) should be made against the [VVV repository](https://github.com/Varying-Vagrant-Vagrants/VVV).

Once a pull request is merged to a branch, Travis CI is used to deploy the built site files to an AWS S3 bucket. Nginx is used to direct traffic to the correct branch directory in the bucket.

Issues to discuss changes to the code and documentation should be opened at the main [VVV repository](https://github.com/Varying-Vagrant-Vagrants/vvv).
