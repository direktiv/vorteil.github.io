---
title: disable-tso
nav_order: 1
layout: default
parent: network
grand_parent: VCFG Reference
---

# disable-tso

The `disable-tso` field determines whether the Vorteil kernel should avoid using a network feature called TCP Segmentation Offloading.

## Summary

```
FIELD       disable-tso
PATH        network[N].disable-tso
PARENT      network
TYPE        Boolean
DEFAULT     false
```

## Example

```toml
[[network]]
  disable-tso = false
```

## CLI Flag

```
--network[0].disable-tso=false
```