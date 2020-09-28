---
title: logfiles
nav_order: 6
layout: default
parent: program
grand_parent: VCFG Reference
---

# logfiles

The `logfiles` field defines which files are reported via the logging configuration. If the folder of the defined log files is empty Vorteil will use virtual files in memory and will not create these files on the filesystem.

## Summary

```
FIELD       logfiles
PATH        program[N].logfiles
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
  logfiles = ["/apache-tomcat-9.0.12/logs/*.log", "/mylogs/logfile.log"]
  cwd = "/"
```

## CLI Flag

```
--program[0].logfiles="/apache-tomcat-9.0.12/logs/*.log"
```