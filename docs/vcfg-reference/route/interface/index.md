---
title: interface
nav_order: 3
layout: default
parent: route
grand_parent: VCFG Reference
---

# interface

The `interface` field determines which network interface should be used to send out network packets handled by the routing rule. Network interfaces on Vorteil begin with "eth0" and count up.

## Summary

```
FIELD 	interface
PATH 	route[N].interface
PARENT 	route
TYPE 	String
DEFAULT 	""
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
--route[0].interface="eth0"
```