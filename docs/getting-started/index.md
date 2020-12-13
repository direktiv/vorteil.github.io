---
title: Getting Started
nav_order: 0
has_children: true
layout: default
has_toc: false
---

# Getting Started

Vorteil is an operating system for running cloud applications on micro virtual machines. It takes only the files you need and runs them on a custom Linux kernel without any unnecessary background services: there's no ssh, no shell, and no login; just a toml file that Vorteil's init process (vinitd) uses to configure the system and launch your apps.

<p align="center">
  <a href="https://github.com/vorteil/vorteil">
    <img src="/assets/getting-started.gif" alt="terminal">
  </a>
</p>

The tools that build Vorteil images have been optimized for speed, and can take your project from loose files to a running virtual machine in as little as one second.

## What hypervisors are supported?

Vorteil supports all major hypervisors including AHV, Xen, KVM, VirtualBox, Firecracker, Hyper-V and VMware. This means that Vorteil supports any private or public cloud environment, including Azure, Google Cloud Platform, and Amazon Web Services.

For the enterprise version of Vorteil, Nutanix and VMware ESXi/vCenter is also supported.

## How many applications are supported?

Vorteil supports any Linux application (32-bit and 64-bit ELF binaries). The Vorteil container converter allows anyone to convert a current containerised application (from any container repository) into a Vorteil micro-VM. Vorteil also runs any legacy applications which are currently hosted on operating systems such as Red Hat, Ubuntu, CentOS, or SUSELinux.

# See Also

* The [Vorteil.io](https://vorteil.io/) website.
* The Vorteil [documentation](https://docs.vorteil.io/).
* The free Vorteil [apps repository](http://apps.vorteil.io/).
* The Vorteil [blog](https://blog.vorteil.io/).
* The [Godoc](https://godoc.org/github.com/vorteil/vorteil) library documentation.
