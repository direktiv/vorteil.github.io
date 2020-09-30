---
title: Amazon Web Services
nav_order: 2
has_children: false
layout: default
parent: Configuring a provisioner
grand_parent: Guides
---

# Amazon Web Services

In this guide we’ll show you how to configure your environment to provision Vorteil apps to the Amazon Web Services platform.

Amazon is a market leader in the cloud-computing space. Many commercial applications are hosted on EC2 in production, so to make life easier for you we've built some support for AWS directly into our tools. 

## Before you start

To follow along all you'll need is the Vorteil command-line interface, which comes with Vorteil Studio.

You'll also need an account with [Amazon AWS](https://aws.amazon.com/) and the ability to deploy virtual machines on [EC2](https://aws.amazon.com/ec2/). You'll also need an [access key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) for this account. Setting up an account with Amazon AWS is beyond the scope of this guide, but by the end of the process you should be able to provide the following information:

    - key: the access key ID
    - secret: the access key secret
    - region: a region you have chosen where your virtual machines will be hosted

You'll also need to manually create a [security group](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html) named "vorteil-provisioner" in the region, allowing inbound TCP traffic from anywhere to port 443.

## Creating an Amazon Web Services provisioner file

To configure an AWS provisioner takes just one command after you've found all of the relevant information from the 'Before you start' section above. Dummy values for each of the three fields listed in the 'Before you start' section are used here as well, use your own values to make AWS work.

```
vorteil provisioners new amazon-ec2 ./aws.provisioner --key=EXAMPLEDATA --region=us-west-1 --secret=MOREEXAMPLEDATA
```

The command will create a file at `./aws.provisioner`, which is a base64-encoded version of the information required to provision to Amazon Web Services. An optional flag, `--passphrase`, can be used when creating the provisioner to encrypt the resulting payload. The passphrase will be required when attempting to use the provisioner in the future.

## Provisioning an image

Now that a provisioner file has been created, it can be used in the provision command to direct our vorteil BUILDABLE. To provision with our new provisioner use the following command:

```
vorteil images provision BUILDABLE ./aws.provisioner --name myimage
```