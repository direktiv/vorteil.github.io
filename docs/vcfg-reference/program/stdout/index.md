---
title: stdout
nav_order: 9
layout: default
parent: program
grand_parent: VCFG Reference
---

# stdout

The `stdout` field determines where the program's stdout will be written.
The default value is "/dev/vtty", which is a device that echoes data to the serial port and the screen.

## Summary

```
FIELD       stdout
PATH        program[N].stdout
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
--program[0].stdout="/dev/vtty"
```