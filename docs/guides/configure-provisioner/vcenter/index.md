---
title: VMware ESXi/vCenter
nav_order: 3
has_children: false
layout: default
parent: Configuring a provisioner
grand_parent: Guides
---
**VMware ESXi/vCenter is only available in the enterprise edition of the Vorteil Tools**

# VMware ESXi/vCenter

In this guide we'll show you how to configure your environment to provision Vorteil apps to a VMware ESXi/vCenter environment.

VMware ESXi/vCenter is the centralized management utility for VMware, and is used to manage virtual machines, multiple ESXi hosts, and all dependent components from a single centralized location. To make life easier for you we've built some support for vCenter directly into our tools. 

## Before you start

To follow along all you'll need is the Vorteil command-line interface, which comes with Vorteil Studio.

You'll also need an account with access to a VMware ESXi/vCenter environment, with permission to read and write to storage, as well as create virtual machines and virtual machine templates. Setting up an account with your chosen VMware ESXi/vCenter environment is beyond the scope of this guide, but by the end of the process you should be able to provide the following information:

    - address: the address at which the environment can be reached (eg. "https://vcsa.example.com")
    - datacenter: the name of the datacenter on which the rest of the required resources are located
    - datastore: the name of a datastore used for file storage
    - host-cluster: name of the host on which virtual machine templates will be created
    - username: username of an appropriately authorized account
    - password: password of an appropriate authorized account

*To gather these details for ESXI you can follow our [tutorial](/docs/guides/configure-provisioner/vcenter-details)*

## Creating an VMware ESXi/vCenter provisioner file

Configuring a VMware ESXi/vCenter provisioner takes just one command after you've found all of the relevant information from the 'Before you start' section above. Dummy values for each of the six fields listed in the 'Before you start' section are used here as well, use your own values to make vCenter work.

```sh
$ vorteil provisioners new vcenter ./vcenter.provisioner --username="administrator@vsphere.local" --password="SuperSecret" \
  --datacenter=MyDatacenter --datastore=MyDatastore --host-cluster=MyHostCluster --address="https://vcsa.example.com"
```

The command will create a file at `./vcenter.provisioner`, which is a base64-encoded version of the information required to provision to VMware ESXi/vCenter. An optional flag, `--passphrase`, can be used when creating the provisioner to encrypt the resulting payload. The passphrase will be required when attempting to use the provisioner in the future.

## Provisioning an image

Now that a provisioner file has been created, it can be used in the provision command to direct our vorteil BUILDABLE. To provision with our new provisioner use the following command:

```
vorteil images provision BUILDABLE ./vcenter.provisioner --name myimage
```