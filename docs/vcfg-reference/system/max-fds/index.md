---
title: max-fds
nav_order: 5
layout: default
parent: system
grand_parent: VCFG Reference
---

# max-fds

The `max-fds` field determines the maximum number of file-descriptors available to the system.

## Summary

```
FIELD       max-fds
PATH        system.max-fds
PARENT      system
TYPE        Integer
DEFAULT     1024
```

## Example

```toml
[system]
  max-fds = 1024
```

## CLI Flag

```
--system.max-fds=1024
```
