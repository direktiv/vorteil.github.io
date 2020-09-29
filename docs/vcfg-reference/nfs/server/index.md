---
title: server
nav_order: 3
layout: default
parent: nfs
grand_parent: VCFG Reference
---

# server

The `server` field determines the location of the server hosting NFS which should be mounted on the file-system.

## Summary

```
FIELD       server
PATH        nfs[N].server
PARENT      nfs
TYPE        String
DEFAULT     ""
```

## Example

```toml
[[nfs]]
  mount = "/mountpoint"
  server = "192.168.1.10"
  options = "vers=4.2,rw"
```

## CLI Flag

```
--nfs[0].server="192.168.1.10"
```