---
title: cwd
nav_order: 4
layout: default
parent: program
grand_parent: VCFG Reference
---

# cwd

The `cwd` field determines what path the program should use as its "current working directory".

## Summary

```
FIELD       cwd
PATH        program[N].cwd
PARENT      program
TYPE        String
DEFAULT     ""
```

## Example

``` toml
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
--program[0].cwd="/"
```