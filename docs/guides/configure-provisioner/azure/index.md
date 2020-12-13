---
title: Microsoft Azure
nav_order: 3
has_children: false
layout: default
parent: Configuring a provisioner
grand_parent: Guides
---

# Microsoft Azure

In this guide we’ll show you how to configure your environment to provision Vorteil apps to Microsoft Azure.
Microsoft Azure is a market leader in the cloud-computing space. Many commercial applications are hosted on Azure in production, so to make life easier for you we've built some support for Azure directly into our tools.

## Before you start 

You'll also need an account with [Microsoft Azure](https://azure.microsoft.com/) configured with the authority to read and write to a storage account/container and create images.vSetting up an account with Microsoft Azure is beyond the scope of this guide, but by the end of the process you should be able to provide the following information:

- **Storage Account name**: name of the storage account to use
- **Storage Account key**: key for the specified storage account
- **Container**: name of the container to use (or create), in which page blobs will be stored
- **Location/Region**: region used when creating new images (must match storage account location)
- **Resource Group**: the resource group used for created images
- **Service Principal File**: a file that is generated from a cli command which will give us authentication to create images (see this article). - Using the Azure CLI, a service principal file can be created as follows: `az ad sp create-for-rbac --sdk-auth > azure.conf` 

## Configuring a Microsoft Azure provisioner

With the required information on-hand, a Microsoft Azure provisioner file can be created as follows:

```sh
$ vorteil provisioners new ./azure.provisioner --storage-account-name="mystorageaccount" --storage-account-key=EXAmplE/KEYdaTa \
  --container="mycontainer" --location="East US" --resource-group="resourcegroup1" --key-file="/PATH/TO/CREDENTIALS/FILE"
```

The command will create a file at ./azure.provisioner, which is a base64-encoded version of the information required to provision to Azure. An optional flag, `--passphrase`, can be used when creating the provisioner to encrypt the resulting payload. The passphrase will be required when attempting to use the provisioner in the future.

## Provisioning an image

Now that a provisioner file has been created, it can be used in the provision command to direct our vorteil BUILDABLE. To provision with our new provisioner use the following command:

```sh
$ vorteil images provision BUILDABLE ./azure.provisioner --name myimage
```
