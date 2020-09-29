---
title: filesystem
nav_order: 2
layout: default
parent: system
grand_parent: VCFG Reference
---

# filesystem

The `filesystem` field can configure what type of filesystem the application is run on.

Enumeration values:

    `ext2`
    `ext4`
    `xfs`

## Summary

```
FIELD       filesystem
PATH        system.filesystem
PARENT      system
TYPE        String
DEFAULT     "ext2"
```

## Example

```toml
[system]
  filesystem = "ext2"
```

## CLI Flag

```
--system.filesystem="ext2"
```
