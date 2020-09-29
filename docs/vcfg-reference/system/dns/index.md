---
title: dns
nav_order: 1
layout: default
parent: system
grand_parent: VCFG Reference
---

# dns

The `dns` field sets a list of DNS servers for the app to use. At most four servers can be defined, and each much be a valid IPv4 address. It is usually not necessary to define DNS servers when using DHCP for your network configuration, since many DHCP servers provide their own list of DNS servers to clients.

## Summary

```
FIELD       dns
PATH        system.dns
PARENT      system
TYPE        []String
DEFAULT     []
```

## Example

```toml
[system]
  dns = ["1.1.1.1", "1.0.0.1"]
```

## CLI Flag

```
--system.dns="1.1.1.1" --system.dns="1.0.0.1"
```