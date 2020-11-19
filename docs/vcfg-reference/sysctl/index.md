---
title: sysctl
nav_order: 5
layout: default
parent: VCFG Reference
has_toc: false
---

# sysctl

The `sysctl` section of the VCFG allows for the modification of kernel attributes and functions by creating/modifying files in the `/proc/sys` directory.

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

*Note: this is a repeatable flag.*

The above examples will result in `/proc/sys/net/ipv4/ip_forward` being created with the value `1` as it's contents.