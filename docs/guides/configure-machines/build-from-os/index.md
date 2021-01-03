---
title: Building a machine from OS
nav_order: 6
layout: default
has_children: false
parent: Configuring a machine
grand_parent: Guides
---

# Building a machine from OS

In some cases a user or application owner might want to build a migrate an application from an OS to Vorteil. This is especially the case with legacy applications (or off-the-shelf applications). A user can always build or migrate from an operating system like Ubuntu or Alpine. For the purpose of this guide, we will use Alpine (however, note that more application support Ubuntu than Alpine).

## Step 1: get the “alpine” package from the Vorteil public repository

```sh
$ wget -O alpine.vorteil https://apps.vorteil.io/file/vorteil/alpine
```

## Step 2: unpack the alpine.vorteil package to a local directory

```sh
$ vorteil unpack alpine.vorteil alpine
```

This will unpack the Vorteil package, which contains the Alpine components. This Alpine image will be used to prep the install of the “dig” application (which is contained in the bind-tools Alpine package) as an example.

## Step 3: create a shell script at /prep.sh which installs application

```sh
$ cat prep.sh
#!/bin/sh
apk add bind-tools
$ chmod +x prep.sh
```

## Step 4: within the “alpine” Vorteil VM, run the VM and ensure the package installs successfully

```sh
$ vorteil run —-program[0].binary /prep.sh --vm.disk-size +128MiB
```

## Step 5: run it in RECORD mode

This runs the app and exports the Vorteil micro virtual machine to ../dig directory:

```sh
$ vorteil run --program[0].binary /prep.sh --vm.disk-size +128MiB --record ../dig
```

## Step 6: aplication is now installed and a Vorteil project created

To use the Vorteil package, configure the existing "alpine" vcfg file to run the `dig` application:

```toml
[[program]]
  binary = "/usr/bin/dig"
  args = "www.vorteil.io"

[[network]]
  ip = "dhcp"

[[vm]]
  cpus = 1
  ram = "256 MiB"
  disk-size = "+128 MiB"
```

