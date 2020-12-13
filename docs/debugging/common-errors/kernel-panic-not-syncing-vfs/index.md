---
title: Kernel panic - not syncing VFS
nav_order: 3
layout: default
has_children: false
parent: Common errors
grand_parent: Debugging
---

# Kernel panic - not syncing VFS

## Symptom

When starting the virtual machine with an XFS filesystem the kernel panics with the following message:

```sh
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(8,2)
```

## Cause

XFS Support was added in kernel version 20.8.1 - any kernels from before this point are unable to mount XFS filesystems.

## Solution

Use kernel 20.8.1 or later.
