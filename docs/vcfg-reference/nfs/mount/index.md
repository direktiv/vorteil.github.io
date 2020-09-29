---
title: mount
nav_order: 1
layout: default
parent: nfs
grand_parent: VCFG Reference
---

# mount 

The `mount` field determines the path where the NFS should be mounted on the file-system.

## Summary

```
FIELD       mount
PATH        nfs[N].mount
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
--nfs[0].mount="/mountpoint"
```