---
title: Sysctl
nav_order: 6
has_children: false
layout: default
parent: Concepts
---

# Sysctl

Sysctl allows for the modification of kernel attributes, and functions by creating/modifying files im the /proc/sys directory.

## Example
VCFG

```toml
[sysctl]
  "net.ipv4.ip_forward" = "1"
```

CLI

```
$ vorteil run local:vorteil/helloworld --sysctl net.ipv4.ip_forward=1
```

The above examples will result in `/proc/sys/net/ipv4/ip_forward` being created, with the value `1`.