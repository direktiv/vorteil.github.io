---
title: privilege
nav_order: 7
layout: default
parent: program
grand_parent: VCFG Reference
---

# privilege

The `privilege` field instructs the program to run as root, superuser, or user (defined by the system.user field).

When set to 'root', the program will run as the root user. When set to 'user' the program will run as the non-root user. When set to 'superuser', the program will run as the non-root user, with the following ambient capabilities:

    CAP_CHOWN
    CAP_DAC_OVERRIDE
    CAP_DAC_READ_SEARCH
    CAP_FOWNER
    CAP_IPC_OWNER
    CAP_NET_ADMIN
    CAP_MKNOD
    CAP_NET_BIND_SERVICE
    CAP_NET_RAW
    CAP_SYS_ADMIN

## Summary

```
FIELD       privilege
PATH        program[N].privilege
PARENT      program
TYPE        String
DEFAULT     root
```

## Example

```toml
[[program]]
  binary = "/usr/bin/path"
  args = "-jar myapp.jar"
  env = ["HOME=/"]
  stdout = "/dev/vtty"
  stderr = "/dev/vtty"
  bootstrap = ["SLEEP 3000"]
  privilege="root"
```

## CLI Flag

```
    --program[0].privilege=root
```