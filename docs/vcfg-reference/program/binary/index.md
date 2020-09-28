---
title: binary
nav_order: 2
layout: default
parent: program
grand_parent: VCFG Reference
---

# binary

The `binary` field determines the path where the program binary is located. Which can also be defined as the first argument of args see.

## Summary

```
FIELD       binary
PATH        program[N].binary
PARENT      program
TYPE        String
DEFAULT     ""
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
  cwd = "/"
```

## CLI Flag

```
--program[0].binary="/usr/bin/path"
```