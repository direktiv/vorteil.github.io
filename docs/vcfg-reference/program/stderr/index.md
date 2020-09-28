---
title: stderr
nav_order: 8
layout: default
parent: program
grand_parent: VCFG Reference
---

# stderr

The `stderr` field determines where the program's stderr will be written.
The default value is "/dev/vtty", which is a device that echoes data to the serial port and the screen.

## Summary

```
FIELD       stderr
PATH        program[N].stderr
PARENT      program
TYPE        String
DEFAULT     "/dev/vtty"
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
--program[0].stderr="/dev/vtty"
```