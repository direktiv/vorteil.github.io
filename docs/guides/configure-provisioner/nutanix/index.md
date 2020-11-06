---
title: Nutanix (Enterprise Edition)
nav_order: 5
has_children: false
layout: default
parent: Configuring a provisioner
grand_parent: Guides
---

# Nutanix

In this guide we'll show you how to configure your environment to provision Vorteil apps to a Nutanix environment.

Nutanix software and cloud services unify IT operations and bring frictionless application mobility across different cloud environments. To make life easier for you we've built some support for Nutanix directly into our tools. 

## Before you start

To follow along all you'll need is the Vorteil command-line interface, which comes with Vorteil Studio.

You'll also need an account with access to a Nutanix environment, with permission to read and write to storage, as well as create virtual machines and virtual machine templates. Setting up an account with your chosen Nutanix environment is beyond the scope of this guide, but by the end of the process you should be able to provide the following information:

    - host: Nutanix host address (eg. 192.168.1.82:9440)
    - username: Nutanix account username to perform API requests as.
    - password: Nutanix account password.

## Creating an Nutanix provisioner file

Configuring a Nutanix provisioner takes just one command after you've found all of the relevant information from the 'Before you start' section above. Dummy values for each of the three fields listed in the 'Before you start' section are used here as well, use your own values to make vCenter work.

```
$ vorteil provisioners new nutanix ./nutanix.provisioner --username admin --password pass --host 192.168.1.101:9440```

The command will create a file at `./nutanix.provisioner`, which is a base64-encoded version of the information required to provision to Nutanix. An optional flag, `--passphrase`, can be used when creating the provisioner to encrypt the resulting payload. The passphrase will be required when attempting to use the provisioner in the future.

## Provisioning an image

Now that a provisioner file has been created, it can be used in the provision command to direct our vorteil BUILDABLE. To provision with our new provisioner use the following command:

```
vorteil images provision BUILDABLE ./nutanix.provisioner --name myimage
```