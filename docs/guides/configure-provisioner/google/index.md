---
title: Google Cloud Platform
nav_order: 1
has_children: false
layout: default
parent: Configuring a provisioner
grand_parent: Guides
---

# Google Cloud Platform

In this guide we’ll show you how to configure your environment to provision Vorteil apps to Google’s Cloud Platform (GCP).

Google is a major cloud provider in the cloud-computing space. Many commercial applications are hosted on Google Cloud Platform in production, so to make life easier for you we’ve built some support for GCP directly into our tools.

## Before you start

You will need an account with Google Cloud Platform set up with a bucket on Google Cloud Storage for storing files as well as the ability to create images on Google Compute Engine. You'll also need a service account key for this account. Setting up an account with Google Cloud Platform is beyond the scope of this guide, but by the end of the process you should be able to provide the following information:

    - service account key: a JSON-formatted service account key file
    - bucket: the name of a bucket you own on Google Storage

## Creating a Google Cloud Platform provisioner file

With the required information on-hand, a Google Cloud Platform provisioner file can be created as follows:

```
vorteil provisioners new google ./gcp.provisioner --bucket="my-bucket" --credentials="/path/to/credentials/file"
```

Replace the value of the `--bucket` flag with the name of your Google Cloud Storage bucket, and the value of the `--credentials` flag with the filepath to the JSON-formatted service account key file. The command will create a file at `./gcp.provisioner`, which is a base64-encoded version of the information required to provision to Google Cloud Platform. An optional flag, `--passphrase`, can be used when creating the provisioner to encrypt the resulting payload. The passphrase will be required when attempting to use the provisioner in the future.

## Provisioning an image

Now that a provisioner file has been created, it can be used in the provision command to direct our vorteil BUILDABLE. To provision with our new provisioner use the following command:

```
vorteil images provision BUILDABLE ./gcp.provisioner --name myimage
```

