---
title: mask
nav_order: 6
layout: default
parent: network
grand_parent: VCFG Reference
---

# mask

The `mask` field sets the subnet mask for the defined network interface. This field should be left empty when using DHCP.

## Summary

```
FIELD 	mask
PATH 	network[N].mask
PARENT 	network
TYPE 	String
DEFAULT 	""
```

## Example

```toml
[[network]]
  ip = "192.168.1.10"
  mask = "255.255.255.0"
  gateway = "192.168.1.253"
```

## CLI Flag

```
--network[0].mask="255.255.255.0"
```