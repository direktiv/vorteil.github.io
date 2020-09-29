---
title: ntp
nav_order: 6
layout: default
parent: system
grand_parent: VCFG Reference
---

# ntp

The `ntp` field configures the app to synchronize time with network time servers. By default the kernel relies upon its system clock, which is not sufficiently accurate for many applications. Up to five time servers can be defined.

## Summary

```
FIELD       ntp
PATH        system.ntp
PARENT      system
TYPE        []String
DEFAULT     []
```

## Example

```toml
[system]
  ntp = ["0.au.pool.ntp.org", "1.au.pool.ntp.org"]
```

## CLI Flag

```
--system.ntp=0.au.pool.ntp.org --system.ntp=1.au.pool.ntp.org
```
