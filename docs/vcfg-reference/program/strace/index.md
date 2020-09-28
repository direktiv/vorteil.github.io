---
title: strace
nav_order: 10
has_children: true
layout: default
parent: program
grand_parent: VCFG Reference
---

# strace

The `strace` field determines whether we need to run the app with strace enabled for debugging purposes.

## Summary

```
FIELD       strace
PATH        program[N].strace
PARENT      program
TYPE        Boolean
DEFAULT     false
```

## Example

```toml
[[program]]
  binary = "/usr/bin/path"
  args = "-jar myapp.jar"
  env = ["HOME=/", "USER=root"]
  stdout = "/dev/vtty"
  stderr = "/dev/vtty"
  bootstrap = ["SLEEP 3000"]
  strace=true
```

## CLI Flag

```
--program[0].strace=true
```