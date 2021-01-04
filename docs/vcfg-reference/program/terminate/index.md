---
title: terminate
nav_order: 11
layout: default
parent: program
grand_parent: VCFG Reference
---

# terminate

The `terminate` field makes it possible to define what system signal to send to a program's process on shutdown.

### Supported Signals:
- SIGTERM (default)
- SIGINT
- SIGKILL
- SIGPWR
- SIGQUIT
- SIGSTOP

## Summary

```
FIELD       terminate
PATH        program[N].terminate
PARENT      program
TYPE        String
DEFAULT     "SIGTERM"
```

## Example

```
[[program]]
  binary = "/usr/bin/path"
  args = "-jar myapp.jar"
  env = ["HOME=/", "USER=root"]
  stdout = "/dev/vtty"
  stderr = "/dev/vtty"
  bootstrap = ["SLEEP 3000"]
  cwd = "/"
  strace = true
  root = true
  terminate = "SIGTERM"
```

## CLI Flag

```
--program[0].terminate="SIGTERM"
```