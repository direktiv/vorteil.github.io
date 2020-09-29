---
title: env
nav_order: 5
layout: default
parent: program
grand_parent: VCFG Reference
---

# env

The `env` field adds environment variables to the program's environment.
Environment variables are defined as KEY=VALUE key-value pairs.

## Summary

```
FIELD       env
PATH        program[N].env
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
--program[0].env="HOME=/" --program.0.env="USER=root"
```