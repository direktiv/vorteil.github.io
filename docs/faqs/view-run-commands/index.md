---
title: What commands are used to run a VM?
nav_order: 2
layout: default
parent: Frequently Asked Questions
---

## What commands are used to run a VM?

The Vorteil CLI supports multiple local hypervisors, and the command/arguments used to create a virtual machine varies between each one. Fortunately, providing the `-d` (debug) flag to the Vorteil CLI when performing a `run` operation will instruct the CLI to print out the exact command that is being exected:

## Example

```
$ vorteil run ./helloworld.vorteil -d
...
Creating QEMU VM with Args: qemu-system-x86_64 ...
```

_Note: the output of the command shown in this example has been manually truncated for brevity._