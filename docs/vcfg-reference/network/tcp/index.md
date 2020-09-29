---
title: tcp
nav_order: 8
layout: default
parent: network
grand_parent: VCFG Reference
---

# tcp

The `tcp` field should contain a list of every port the app will listen for TCP traffic on. This field has no direct impact on the app’s runtime, but it is instructive for users to understand the app. Provisioning tools may also use this field to make external changes such as adjusting firewall rules or configuring NAT forwarding to the virtual machine.

Ports should not appear in multiple protocol fields. Even though HTTP and HTTPS are implemented over TCP, ports listed in the http and https fields should not be repeated in the tcp field.

## Summary

```
FIELD 	tcp
PATH 	network[N].tcp
PARENT 	network
TYPE 	[]String
DEFAULT 	[]
```

## Example

```toml
[[network]]
  tcp = ["8000", "8001"]
```

## CLI Flag

```
--network[0].tcp="8000" --network[0].tcp="8001"
```