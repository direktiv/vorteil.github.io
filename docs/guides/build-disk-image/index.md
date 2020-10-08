---
title: Builing a disk image
nav_order: 5
layout: default
parent: Guides
---

# Building a disk image

In this guide we'll show you how to turn a Vorteil project into a virtual disk image file.

## Before you start

If you do not already have a Vorteil project available to follow this guide with, download a package from [apps.vorteil.io](https://apps.vorteil.io/) and unpack it to create a project:

```
wget -O helloworld.vorteil https://apps.vorteil.io/file/vorteil/helloworld
vorteil unpack ./helloworld.vorteil ./helloworld
```

## Building the disk image

Building a virtual machine disk image from a project is easy. Just provide the path to the Vorteil project as an argument when running the `build` command:

```
$ vorteil images build helloworld/
Build [=============================================================] 100.00% 0s
created image: helloworld.vmdk
```

**NOTE:** this action can be performed on Vorteil package files, too!

### Build different disk images

This command will create "helloworld.vmdk" -- a virtual disk image -- from the project. Depending upon the ultimate purpose of the image, you might prefer to build a disk image format other than VMDK. To choose a specific image format add the `--format=FORMAT` flag to the command. Supported values for the `--format` flag include:

- vmdk
- fixed-vhd and dynamic-vhd
- ova
- raw
- gcp
- xva

### Example:

```
$ vorteil images build helloworld/ --format=raw
```
