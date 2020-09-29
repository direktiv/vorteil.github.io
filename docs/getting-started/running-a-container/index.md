---
title: Running a container
nav_order: 4
has_children: false
layout: default
parent: Getting Started
---

# Running a container

An easy way to build Vorteil micro virtual machines is to build them from container images. Vorteil can convert all OCI compliant images from remote repositories or local docker and containerd runtimes. The following command would convert the _hello-world_ application from docker hub.

```sh

# converts hello-world from docker hub into /tmp/hello
vorteil projects convert-container hello-world /tmp/hello

# converts hello-world from local docker into /tmp/hellolocal
vorteil projects convert-container local.docker/hello-world /tmp/hellolocal

# run it
vorteil run /tmp/hellolocal

```