---
title: Running multiple programs
nav_order: 4
layout: default
has_children: false
parent: Configuring a machine
grand_parent: Guides
---

# Running multiple programs

Vorteil is capable of running any number of apps in the same Virtual Machine. The repeatable `[[program]]` field of a VCFG file is used to defined each program that will be run when the virtual machine is powered on.

## Configuration

The following example demonstrates how a VCFG might look if the user was to configure their Vorteil app to run multiple programs:

```toml
[[program]]
  binary    = "/bin/myAmazingProgram"
  args      = "--start"
  env       = ["HELLO=WORLD"]
  bootstrap = []

[[program]]
  binary    = "/bin/myOtherAmazingProgram"
  args      = ""
  env       = [""]
  bootstrap = ["SLEEP 1000"]
```

Roughly translated, this is the equivalent of running the following from a terminal:

```sh
# Terminal 1:
$ HELLO=WORLD /bin/myAmazingProgram --start
```

```sh
# Terminal 2:
$ sleep 1 && /bin/myOtherAmazingProgram
```

Note that the structure of a VCFG file allows users to define environment variables specific to each individual program.

The bootstrap field allows for a number of actions to be performed prior to the program. In this example, it was used to delay the execution of `/bin/myOtherAmazingProgram` by 1000 miliseconds (1 second). More information about this can be found [here](/docs/concepts/bootstrapping/).
