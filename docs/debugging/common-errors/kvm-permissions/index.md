---
title: KVM permissions
nav_order: 4
layout: default
has_children: false
parent: Common errors
grand_parent: Debugging
---

# KVM permissions

## Symptom

When running `vorteil run` with KVM as platform the command returns with:

```sh
Could not access KVM kernel module: Permission denied
qemu-system-x86_64: failed to initialize KVM: Permission denied
```

## Cause

The user running this command is not in the `kvm` group. Linux uses the device `/dev/kvm` which has an ownership of root.kvm with file mode **'rw-rw----'** which means only `root` and members of `kvm` can use it.

## Solution

The user using this service needs to be added to the kvm group with the `useradd` command:

```sh
sudo adduser `id -un` kvm
```

Restart the computer.
