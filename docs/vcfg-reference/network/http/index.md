---
title: http
nav_order: 3
layout: default
parent: network
grand_parent: VCFG Reference
---

# http

The `http` field should contain a list of every port the app will listen for HTTP traffic on. This field has no direct impact on the app’s runtime, but it is instructive for users to understand the app. Provisioning tools may also use this field to make external changes such as adjusting firewall rules or configuring NAT forwarding to the virtual machine.

Ports should not appear in multiple protocol fields. Even though HTTP is implemented over TCP, ports listed in the http field should not be repeated in the tcp field.

## Summary

```
FIELD       http
PATH        network[N].http
PARENT      network
TYPE        []String
DEFAULT     []
```

## Example

```toml
[[network]]
  http = ["80", "8080"]
```

## CLI Flag

```
--network[0].http="80" --network[0].http="8080"
```