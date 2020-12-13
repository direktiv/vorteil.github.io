---
title: Attach a second disk
nav_order: 2
layout: default
has_children: false
parent: Configuring a machine
grand_parent: Guides
---

# Attach a second disk

It is possible to attach a second disk to a Vorteil machine. This article details how to do so, and what results users can expect to see. The first-detected additional data disk will be mounted to the path specified by the `data-disk.mountpoint` field of the VCFG (Vorteil Configuration), defaulting to `/vorteil-data` mount point in the virtual machine. 

**NOTE: This action requires a premium license.**

## Example

```toml
[data-disk]
  mountpoint = "/disk2"
```

**NOTE: If the disk that is being mounted is completely empty (all 0x00 bytes), Vorteil will automatically format and partition the disk according to the filesystem format used by the boot disk.**

