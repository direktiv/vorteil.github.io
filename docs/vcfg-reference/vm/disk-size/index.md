---
title: disk-size
nav_order: 2
layout: default
parent: vm
grand_parent: VCFG Reference
---

# disk-size

The `disk-size` field suggests a sensible minimum size for the virtual disk to be built for the app.

As a convenience, this field has a unique behaviour when set to zero or is prefixed with a "+" plus symbol. When set as zero the compiler will decide for itself how big the disk should be and will do its best to make the disk big enough for its initial contents and no bigger. When set with a plus symbol the compiler will estimate the correct size as it would for a zero size, then add the provided value on top as free space.

For example, if setting disk-size to "0" results in a 128 MiB virtual disk, setting disk-size to "+64 MiB" is likely to result in a roughly 192 MiB virtual disk. This can be helpful if the package is still under development or is meant to be distributed incomplete, as it should ensure that compilation always works regardless of the file-system contents.


## Summary

```
FIELD       disk-size
PATH        vm.disk-size
PARENT      vm
TYPE        Size
DEFAULT     0
```

## Example

```toml
[vm]
  disk-size = "+64 MiB"
```

## CLI Flag

```
--vm.disk-size="+64 MiB"
```