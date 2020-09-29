---
title: gateway
nav_order: 2
layout: default
parent: network
grand_parent: VCFG Reference
---

# gateway

The `gateway` field sets the default network gateway to use over the defined network interface. This field should be left empty when using DHCP.

## Summary

```
FIELD       gateway
PATH        network[N].gateway
PARENT      network
TYPE        String
DEFAULT     ""
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
--network[0].gateway="192.168.1.253"
```