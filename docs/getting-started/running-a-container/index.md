---
title: Running a container
nav_order: 5
has_children: false
layout: default
parent: Getting Started
---

# Running a container

An easy way to build Vorteil micro virtual machines is to build them from container images. Vorteil can convert all OCI compliant images from remote repositories or local docker and containerd runtimes. 

The following command would convert the _hello-world_ application from docker hub (which is the default container repository if not specified):

```sh
# converts hello-world from docker hub into /tmp/hello
$ vorteil projects convert-container hello-world /tmp/hello
```

The following command would convert the _hello-world_ application from a local repository:

```sh
# converts hello-world from local docker into /tmp/hellolocal
$ vorteil projects convert-container local.docker/hello-world /tmp/hellolocal
```

```sh
# run it
$ vorteil run /tmp/hellolocal
```

## Configuring container repositories

The `vorteil projects convert-container` command can also take a configuration file as an input for additional repository locations (using the `--config registry.yaml` argument). An example of the `registry.yaml` file is shown below:

```yaml
repositories:
  mcr.microsoft.com:
   url: https://mcr.microsoft.com
  docker.io:
   url: https://registry-1.docker.io
```

Example usage (to convert Microsoft SQL Server from the Microsoft registry):

```sh
$ vorteil projects convert-container --config vconvert.yaml mcr.microsoft.com/mssql/server mssql
convert image: mssql/server:latest
registry mcr.microsoft.com, url https://mcr.microsoft.com
downloading manifest file
downloading 7 layers
layer 171857c4: done [==============================================================================] 25.5 MiB / 25.5 MiB
layer 61e52f86: done [==============================================================================] 162.0 b / 162.0 b
layer 41964044: done [==============================================================================] 852.0 b / 852.0 b
layer 8b5eb8c1: done [==============================================================================] 68.4 MiB / 68.4 MiB
layer e7083eff:   0s [==============================================================================] 251.0 b / 251.0 b
layer b469c4d6:   0s [============================================================================] 343.1 MiB / 343.1 MiB
layer ec9a85cf:   0s [==============================================================================] 26.6 MiB / 26.6 MiB
all layers downloaded
unpack layer /var/folders/km/4yk3h84934x_mp9fcph321mm0000gn/T/vtest463363347/171857c4.tar into mssql
unpack layer /var/folders/km/4yk3h84934x_mp9fcph321mm0000gn/T/vtest463363347/41964044.tar into mssql
unpack layer /var/folders/km/4yk3h84934x_mp9fcph321mm0000gn/T/vtest463363347/61e52f86.tar into mssql
unpack layer /var/folders/km/4yk3h84934x_mp9fcph321mm0000gn/T/vtest463363347/e7083eff.tar into mssql
unpack layer /var/folders/km/4yk3h84934x_mp9fcph321mm0000gn/T/vtest463363347/8b5eb8c1.tar into mssql
unpack layer /var/folders/km/4yk3h84934x_mp9fcph321mm0000gn/T/vtest463363347/b469c4d6.tar into mssql
unpack layer /var/folders/km/4yk3h84934x_mp9fcph321mm0000gn/T/vtest463363347/ec9a85cf.tar into mssql
files created into mssql
```

## Important NOTE

When a container is converted from the container registry, legacy OS files are included in the converted container. Some of the files which could cause conflicts with the Vorteil machine operations are:
- `/etc/resolv.conf`: forcing alternative DNS servers or lookups
- `/etc/nsswitch.conf`: disabling DNS or preferring file lookup only
- `/etc/hosts`: static definitions of host lookups

It is suggested that these file be removed / reviewed before running the Vorteil converted machine.
