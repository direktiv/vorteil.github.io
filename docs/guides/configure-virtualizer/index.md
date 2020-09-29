---
title: Configuring a virtualizer
nav_order: 1
has_children: false
layout: default
parent: Guides
---

# Configuring a virtualizer

The Vorteil CLI supports a number of hypervisors for running virtual machines on a local machine, without the need for any hypervisor-specific configuration, as long as at least one supported hypervisor is installed on the system.

## Installing a supported hypervisor

### QEMU
Supports Windows, Mac, and Linux, and has a fairly straightforward installation process. _Installation instructions from [qemu.org](https://www.qemu.org/download/)_

#### Windows
Download links for Windows installers are listed on [qemu.org](https://www.qemu.org/download/#windows) 

#### Mac
- **Brew**: `brew install qemu`
- **MacPorts**: `sudo port install qemu`

#### Linux
-   **Arch:** `pacman -S qemu`
-   **Debian/Ubuntu:** `apt-get install qemu`
-   **Fedora:** `dnf install @virtualization`
-   **Gentoo:** `emerge --ask app-emulation/qemu`
-   **RHEL/CentOS:** `yum install qemu-kvm`
-   **SUSE:** `zypper install qemu`

### Hyper-V
Supports Windows only. Users must [enable Hyper-V](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v) and must be a member of the Hyper-V administrator group (instructions [here](https://www.ibm.com/support/knowledgecenter/SSMKFH/com.ibm.apmaas.doc/install/hyperv_config_add_nonadmin_user_hyperv_usergroup.html)).

### VirtualBox
Supports Windows, Mac, and Linux. Download links for the VirtualBox installers can be found [here](https://www.virtualbox.org/wiki/Downloads).

### Firecracker
Supports Linux only. KVM must be installed on the local machine, and can be acquired through the use of a package manager. On Ubuntu, use the following command:

```
sudo apt-get install qemu-kvm
```

Before running anything on Firecracker, execute the following command in a separate terminal window (this operation spawns a DHCP server, HTTP listener, and creates a bridged network device if necessary). This process will remain active until manually terminated:

```
sudo ./vorteil firecracker-setup
```
