---
title: config
nav_order: 1
layout: default
parent: logging
grand_parent: VCFG Reference
---

# config

The `config` field is a list of key/value pairs which are equal to the configuration entries in fluentbits output plugins.

## Summary

```
FIELD       config
PATH        logging[N].config
PARENT      logging
TYPE        []String
DEFAULT     ""
```

## Example

```toml
[[logging]]
  config = ["Name=tcp" , "Host=192.168.1.10", "Port=3000", "Format=json", "tls=Off"]
  type = "system"
```

## CLI Flag

```
--logging[0].config="Name=tcp" --logging[0].config="Format=json"
```