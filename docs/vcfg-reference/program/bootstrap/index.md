---
title: bootstrapping
nav_order: 3
layout: default
parent: program
grand_parent: VCFG Reference
---

# bootstrapping

The `bootstrap` field makes it possible to define a series of steps to perform before starting the program. It adds a limited but lightweight form of scripting to packages without needing to include a full-blown shell on the disk.

## Summary

```
FIELD       bootstrap
PATH        program[N].bootstrap
PARENT      program
TYPE        []String
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
--program[0].bootstrap="SLEEP 3000"
```