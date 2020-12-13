---
title: Installation
nav_order: 1
has_children: false
layout: default
parent: Getting Started
---

## System requirements

The user desktop or laptop operating system is one of the following:
* MacOS 10.14: Mojave - 2018 or later
* Ubuntu 18.04.3 LTS 2019 or later
* Microsoft Windows 10 or later

_Note: for Windows support - since the introduction of built-in Hyper-V for Windows 10, some virtualisation platforms cannot function correctly while certain Windows features are enabled, including Windows Subsystem for Linux, Device Guard, and Credential Guard. Please see the hypervisor vendor for details, as in some cases the latest versions of the hypervisor are compatible with Hyper-v._

The user desktop virtualisation platform for local use is:
* QEMU 4.1.0 or later
* Virtualbox 6.0 or later (however, latest version is suggested)
* VMware Fusion 11.x or later
* VMware Workstation 14.1.8 or later

## Installation

The Vorteil binary runs anywhere, just download the archive for your system, extract it, and put the executable on your `PATH`.

### Linux
```sh
wget https://github.com/vorteil/vorteil/releases/latest/download/vorteil_linux-x86.tar.gz
tar -xzf vorteil_linux-x86.tar.gz
./vorteil version
```
### Windows

```sh
wget https://github.com/vorteil/vorteil/releases/latest/download/vorteil_windows-x86.zip -UseBasicParsing -OutFile .\vorteil_windows-x86.zip
Expand-Archive -Path .\vorteil_windows-x86.zip -DestinationPath .\
.\vorteil.exe version
```

### Mac

```sh
curl -LJO https://github.com/vorteil/vorteil/releases/latest/download/vorteil_darwin-x86.dmg
hdiutil attach vorteil_darwin-x86.dmg
cp /Volumes/Vorteil\ CLI/vorteil ./vorteil
hdiutil detach /Volumes/Vorteil\ CLI
./vorteil version
```

### Dependencies

To use the `vorteil run` command you'll need [VirtualBox](https://www.virtualbox.org/wiki/Downloads), [QEMU](https://www.qemu.org/download/), [firecracker](https://github.com/firecracker-microvm/firecracker) or Hyper-V installed on your system and reachable on the `PATH`.

If you're using Windows, it's recommended that you enable developer mode as well, so that the tools can use Unix-style symlinks.

## Building From Source

These tools are 100% written in Go, which means compiling them is the same as compiling most simple Go programs.

```sh
go build github.com/vorteil/vorteil/cmd/vorteil
```

### Code of Conduct

We have adopted the [Contributor Covenant](https://github.com/vorteil/.github/blob/master/CODE_OF_CONDUCT.md) code of conduct.

### Contributing

Any feedback and contributions are welcome. Read our [contributing guidelines](https://github.com/vorteil/.github/blob/master/CONTRIBUTING.md) for details.

## License

Distributed under the Apache 2.0 License. See `LICENSE` for more information.
