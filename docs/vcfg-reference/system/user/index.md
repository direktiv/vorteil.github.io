---
title: user
nav_order: 8
layout: default
parent: system
grand_parent: VCFG Reference
---

# user

The `user` field can be used to configure your projects user & group. During the runtime of a machine, the user field is read by the kernel and a corresponding user and group are set in the machines /etc directory. The UID and GID for this user are always set to 1000. This can be useful for when an application requires to be executed by a specific user.

By default, this field is set to "vorteil" . If this field is omitted in a projects VCFG, the user and group entry for "vorteil" will still be added.

## Summary

```
FIELD       user
PATH        system.user
PARENT      system
TYPE        String
DEFAULT     "vorteil"
```

## Example

```toml
[system]
  user = "vorteil"
```

# CLI Flag

```
--system.user="vorteil"
```
