---
title: ram
nav_order: 5
layout: default
parent: vm
grand_parent: VCFG Reference
---

# ram

The `ram` field suggests how much virtual memory should be allocated to the app.

## Summary

```
FIELD       ram
PATH        vm.ram
PARENT      vm
TYPE        Size
DEFAULT     "256 MiB"
```

## Example

```toml
[vm]
  ram = "256 MiB"
```

## CLI Flag

```
--vm.ram="256 MiB"
```