---
title: https
nav_order: 4
layout: default
parent: network
grand_parent: VCFG Reference
---

# https

The `https` field should contain a list of every port the app will listen for HTTPS traffic on. This field has no direct impact on the app’s runtime, but it is instructive for users to understand the app. Provisioning tools may also use this field to make external changes such as adjusting firewall rules or configuring NAT forwarding to the virtual machine.

Ports should not appear in multiple protocol fields. Even though HTTPS is implemented over TCP, ports listed in the https field should not be repeated in the tcp field.

## Summary

```
FIELD       https
PATH        network[N].https
PARENT      network
TYPE        []String
DEFAULT     []
```

## Example

```toml
[[network]]
  https = ["443", "8443"]
```

## CLI Flag

```
--network[0].https="443" --network[0].https="8443"
```