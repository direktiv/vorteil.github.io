---
title: kernel
nav_order: 4
layout: default
parent: vm
grand_parent: VCFG Reference
---

# kernel

The `kernel` field suggests a version of the kernel to use. It is up to the compiler to make the final decision about which kernel to use, but the standard compiler requires an exact match.

## Summary

```
FIELD       kernel
PATH        vm.kernel
PARENT      vm
TYPE        String
DEFAULT     ""
```

## Example

```toml
[vm]
  kernel = "20.9.1"
```

## CLI Flag

```
--vm.kernel=20.9.1
```