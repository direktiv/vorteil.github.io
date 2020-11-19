---
title: sysctl
nav_order: 5
layout: default
parent: VCFG Reference
has_toc: false
---

# sysctl

The repeatable `sysctl` flag allows for the modification of kernel attributes and functions by creating/modifying files in the `/proc/sys` directory.

## Example

### VCFG

```toml
[sysctl]
  "net.ipv4.ip_forward" = "1"
```

### CLI

```
$ vorteil run ./helloworld --sysctl net.ipv4.ip_forward=1
```

The above examples will result in `/proc/sys/net/ipv4/ip_forward` being created with the value `1` as it's contents.