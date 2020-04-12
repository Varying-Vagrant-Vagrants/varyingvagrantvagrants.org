---
category: 5. Troubleshooting
order: 3
title: Testing
description: How To Test VVV
permalink: /docs/en-US/troubleshooting/testing/
---

## Main VVV Repo

To test changes to the main repo, we need to check that it doesn't break an existing VM, and that it doesn't stop new VVV installs from working.

### Checking An Existing VM

Take an existing VVV install, and switch to the branch that has the changes, then reprovision. GitHub will have CLI instructions for how to checkout the branch with the new changes near the merge button.

Once the folder has the changes, run `vagrant halt && vagrant up --provision`.

## Utilities

You can test a new utility by adding it to `config/config.yml` and reprovisioning.

To test changes to the core provisioner, delete the `provision/utilities/core` folder, then change the `config/config.yml` file to match the repo and branch you'd like to test:

```yaml
utility-sources:
  core:
    repo: URL of repo to test
    branch: name of branch to test
```

Then, halt the VM and reprovision: `vagrant halt && vagrant up --provision`

## Dashboard

```yaml
```

## Custom Site Template

```yaml
```

If the pull request adds new parameters, check that they work as expected, and check that things still work if the parameter is missing/blank.

## Custom Site Template Develop

```yaml
```
