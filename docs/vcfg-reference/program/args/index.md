---
title: args
nav_order: 1
layout: default
parent: program
grand_parent: VCFG Reference
---

# args

The `args` field determines the command-line arguments to be provided to the program. Which can also contain the 0th argument being the binary being run.

## Summary

```
FIELD       args
PATH        program[N].args
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
--program[0].args="-jar myapp.jar"
```