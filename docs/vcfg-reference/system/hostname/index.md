---
title: hostname
nav_order: 3
layout: default
parent: system
grand_parent: VCFG Reference
---

# hostname

The `hostname` field sets the app's hostname on the local network. Left undefined, the Vorteil kernel will generate a hostname with a section of randomness to reduce the potential for hostname collisions on the network.

## Summary

```
FIELD       hostname
PATH        system.hostname
PARENT      system
TYPE        String
DEFAULT     ""
```

## Example

```toml
[system]
  hostname = "myapp"
```

## CLI Flag

```
--system.hostname="myapp"
```