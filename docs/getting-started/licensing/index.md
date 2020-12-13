---
title: Enterprise Vorteil features
nav_order: 6
has_children: false
layout: default
parent: Getting Started
---

A default Vorteil installation is unlicensed and open source, however there is an enterprise version with additional capabilities. This article documents the process of acquiring an enterprise license and details the features that enterprise licenses grant access to.

## How can I acquire an enterprise license?
Get in touch with us at [help@vorteil.io](mailto:help@vorteil.io).

## How do I install an enterprise license?
```sh
$ vorteil license register <PATH_TO_LICENSE_FILE>
```

Finally, it is possible to verify that the Vorteil installation has accepted the license by running:

```sh
$ vorteil license info
```

## What limitations do free licenses have versus premium licenses?

The open source version can do almost everything that a premium license can do, with some restrictions. Disk images built using a Vorteil installation registered with a free license will not be able to contain:

- Nutanix and VMware provisioners
- ext4 and xfs file system
- multiple NICs (network interface controllers)

