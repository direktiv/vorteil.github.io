---
title: Getting Started
nav_order: 1
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

## See Also

* The [Vorteil.io](https://vorteil.io/) website.
* The Vorteil [documentation](https://docs.vorteil.io/).
* The free Vorteil [apps repository](http://apps.vorteil.io/).
* The Vorteil [blog](https://blog.vorteil.io/).
* The [Godoc](https://godoc.org/github.com/vorteil/vorteil) library documentation.
