---
title: Modifying "Hello World"
nav_order: 2
has_children: false
layout: default
parent: Getting Started
---

# Modifying "Hello World"

```sh
wget -O helloworld.vorteil https://apps.vorteil.io/file/vorteil/helloworld
vorteil unpack helloworld.vorteil helloworld
ls helloworld
```

These commands download a Vorteil package and use the `vorteil unpack` command to extract its contents into a structured Vorteil project directory. Think of this directory like it will become the root directory on your app's virtual machine. You can modify the app's file-system contents by changing the files in this directory.

There are two types of special files in the project directory: `.vorteilproject` and files that end with the `.vcfg` file extension. These are used by Vorteil to understand how to build the virtual machine and what it should do when it's running.

Make whatever changes you need to make, then repackage them.

```sh
vorteil pack helloworld -o helloworld-modified.vorteil
```

This `vorteil pack` command packs up your project directory into a package file again.

```sh
vorteil run helloworld-modified.vorteil
```

Try out your modified package by using the `vorteil run` command on it.