---
title: "KVM kernel module: Permission denied"
nav_order: 1
layout: default
parent: Frequently Asked Questions
---

## Symptoms

When running `vorteil run` with KVM the command returns with:

```
Could not access KVM kernel module: Permission denied
qemu-system-x86_64: failed to initialize KVM: Permission denied
```

## Cause

The user running this command is not in the `kvm` group. Linux uses the device /dev/kvm which has an ownership of root.kvm with file mode 'rw-rw----' which means only root and members of `kvm` can use it.

## Solution

The user using this service needs to be added to the kvm group with the 'useradd' command:

```
sudo adduser `id -un` kvm
```

Restart the computer.