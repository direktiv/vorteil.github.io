---
title: ip
nav_order: 5
layout: default
parent: network
grand_parent: VCFG Reference
---

# ip

The `ip` field sets the static IP which the kernel should assign to the defined network interface. This field can be set to "dhcp" to use DHCP instead of a static IP address. Each defined network should set a value for this field.

## Summary

```
FIELD       ip
PATH        network[N].ip
PARENT      network
TYPE        String
DEFAULT     "dhcp"
```

## Example

```toml
[[network]]
  ip = "dhcp"
```

## CLI Flag

```
--network[0].ip="dhcp"
```