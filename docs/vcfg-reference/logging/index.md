---
title: logging
nav_order: 6
has_children: true
layout: default
parent: VCFG Reference
has_toc: false
---

# logging

The repeatable `logging` section of a VCFG defines the log destinations for the different log types. Three different log types are available.

- kernel
  - reports CPU, disk, and memory usage
  - reports disk and network i/o
- system
  - reports all kernel messages
- programs
  - reports all `syslog` and `stdout` messages plus all data written to the defined log files in the [program/logfiles](../program/logfiles) section.


If at least one logging section is defined an internal [fluentbit](https://fluentbit.io) instance starts and configures itself based on the provided information in the VCFG.

Alternatively, custom configuration files can be provided. If Vorteil finds a file named `/fluentbit.cfg` it uses this file instead of the VCFG configuration.

## Summary

<table class="table summary">
  <tr>
    <td class="key-column">REPEATABLE SECTION</td>
    <td>logging</td>
  </tr>
  <tr>
    <td>PATH</td>
    <td>logging</td>
  </tr>
  <tr>
    <td>PARENT</td>
    <td><a href="../">VCFG</a></td>
  </tr>
  <tr>
    <td rowspan="0">FIELDS</td>
    <td><a href="config">config</a></td>
  </tr>
  <tr>
    <td><a href="type">type</a></td>
  </tr>
</table>

## Example

```toml
[[logging]]
  config = ["Name=tcp" , "Host=192.168.1.10", "Port=3000", "Format=json", "tls=Off"]
  type = "system"
```

## CLI Flags

As a repeatable section, CLI flags aimed at fields contained within each section must be referenced with an index defining which `logging` section the flag applies to. All flags have the form `--logging[N].field`, where N is a number identifying which logging entry to use.