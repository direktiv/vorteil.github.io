---
title: type
nav_order: 2
layout: default
parent: logging
grand_parent: VCFG Reference
---

# type

The `type` field determines which logs are collected. Three different types are supported:

    - kernel
    - system
    - programs

## Summary

```
FIELD       type
PATH        logging[N].type
PARENT      logging
TYPE        String
DEFAULT     ""
```

## Example

```toml
[[logging]]
  config = ["Name=tcp" , "Host=192.168.1.10", "Port=3000", "Format=json", "tls=Off"]
  type = "kernel"
```

## CLI Flag

```
--logging[0].type="system"
```