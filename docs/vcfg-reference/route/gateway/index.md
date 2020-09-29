---
title: gateway
nav_order: 2
layout: default
parent: route
grand_parent: VCFG Reference
---

# gateway

The `gateway` field determines where network packets handled by the routing rule should be sent for further routing.

## Summary

```
FIELD       gateway
PATH        route[N].gateway
PARENT      route
TYPE        String
DEFAULT     ""
```

## Example

```toml
[[route]]
  destination = "10.0.1.0/24"
  gateway = "192.168.1.253"
  interface = "eth0"
```

## CLI Flag

```
--route[0].gateway="192.168.1.253"
```