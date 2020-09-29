---
title: output-mode
nav_order: 7
layout: default
parent: system
grand_parent: VCFG Reference
---

# output-mode

The `output-mode` field can configure the kernel to alter the way it displays or outputs information. By default, anything written to stdout or stderr, or by the kernel is printed to the virtual machine’s serial port and displayed on its screen. Other options allow the developer to disable either or both of those outputs, potentially improving performance.

Enumeration values:

    `standard`
    `screen`
    `serial`
    `disabled`

## Summary

```
FIELD       output-mode
PATH        system.output-mode
PARENT      system
TYPE        String
DEFAULT     "standard"
```

## Example

```toml
[system]
  output-mode = "standard"
```

## CLI Flag

```
--system.output-mode="standard"
```
