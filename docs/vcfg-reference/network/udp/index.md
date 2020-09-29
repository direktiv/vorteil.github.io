---
title: udp
nav_order: 10
layout: default
parent: network
grand_parent: VCFG Reference
---

# udp

The `udp` field should contain a list of every port the app will listen for UDP traffic on. This field has no direct impact on the app’s runtime, but it is instructive for users to understand the app. Provisioning tools may also use this field to make external changes such as adjusting firewall rules or configuring NAT forwarding to the virtual machine.

## Summary

```
FIELD       udp
PATH        network[N].udp
PARENT      network
TYPE        []String
DEFAULT     []
```

## Example

```toml
[[network]]
  udp = ["8000", "8001"]
```

## CLI Flag

```
--network[0].udp="8000" --network[0].udp="8001"
```