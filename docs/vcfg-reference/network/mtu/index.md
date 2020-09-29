---
title: mtu
nav_order: 7
layout: default
parent: network
grand_parent: VCFG Reference
---

# mtu

The `mtu` field sets the maximum transmission unit for the network interface.

## Summary

```
FIELD       mtu
PATH        network[N].mtu
PARENT      network
TYPE        Integer
DEFAULT     1500
```

## Example

```toml
[[network]]
  mtu = 1500
```

## CLI Flag

```
--network[0].mtu=1500
```