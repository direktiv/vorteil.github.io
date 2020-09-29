---
title: inodes
nav_order: 3
layout: default
parent: vm
grand_parent: VCFG Reference
---

# inodes

The `inodes` field suggests a sensible minimum number of inodes to be added to the app's file-system. The number will very rarely match precisely the number of inodes on the image because the compiler performs optimizations to squeeze out as many 'free' inodes as possible.

## Summary

```
FIELD       inodes
PATH        vm.inodes
PARENT      vm
TYPE        Integer
DEFAULT     1024
```

## Example

```toml
[vm]
  inodes = 1024
```

## CLI Flag

```
--vm.indoes=1024
```