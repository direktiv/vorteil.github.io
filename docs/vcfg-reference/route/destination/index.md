---
title: destination
nav_order: 1
layout: default
parent: route
grand_parent: VCFG Reference
---

# destination

The `destination` field determines whether the routing rule applies to network traffic by matching the outgoing destination address of packets against the provided CIDR address range.

## Summary

```
FIELD 	destination
PATH 	route[N].destination
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
--route[0].hostname="10.0.1.0/24"
```