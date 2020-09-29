---
title: kernel-args
nav_order: 4
layout: default
parent: system
grand_parent: VCFG Reference
---

# kernel-args

The `kernel-args` field can configure the behaviour of the kernel. It can be provided with common Linux kernel arguments to override its default behaviour.

Two additional non-Linux values can be set here:

    `shm`: Defines the size of the /dev/shm partition, e.g. shm=1M"
    `huge`: Defines the number of huge pages, e.g. huge=20

## Summary

```
FIELD       kernel-args
PATH        system.kernel-args
PARENT      system
TYPE        String
DEFAULT     ""
```

## Example

```toml
[system]
  kernel-args = "shm=1M"
```

## CLI Flag

```
--system.kernel-args="shm=1M"
```