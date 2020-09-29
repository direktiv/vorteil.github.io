---
title: options
nav_order: 2
layout: default
parent: nfs
grand_parent: VCFG Reference
---

# options 

The `options` field makes it possible to configure the NFS client behaviour using standard Linux NFS command-line options.

Note: When using NFS3, the "nolock" option is required because Vorteil's NFS client does not support file locking.

## Summary

```
FIELD       options
PATH        nfs[N].options
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
--nfs[0].options="vers=4.2,rw"
```