---
title: tcpdump
nav_order: 9
layout: default
parent: network
grand_parent: VCFG Reference
---

# tcpdump

The `tcpdump` field captures all UDP and TCP traffic on the network interface it's configured on, and prints the results.

## Summary

```
FIELD       tcpdump
PATH        network[N].tcpdump
PARENT      network
TYPE        Boolean
DEFAULT     false
```

## Example

```toml
[[network]]
  tcpdump=true
```

## CLI Flag

```
--network[0].tcpdump=true
```