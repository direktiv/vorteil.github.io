---
title: cpus
nav_order: 1
layout: default
parent: vm
grand_parent: VCFG Reference
---

# cpus

The `cpus` field suggests how many virtual CPUs should be allocated to the app.

## Summary

```
FIELD       cpus
PATH        vm.cpus
PARENT      vm
TYPE        Integer
DEFAULT     1
```

## Example

```toml
[vm]
  cpus = 1
```

## CLI Flag

```
--vm.cpus=1
```