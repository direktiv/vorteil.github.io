---
title: program
nav_order: 1
has_children: true
layout: default
parent: VCFG Reference
has_toc: false
---

# program

The repeatable "program" section of a VCFG defines what programs will be executed by the VM. At least one program section must be defined.

## Summary

<table class="table summary">
  <tr>
    <td class="key-column">REPEATABLE SECTION</td>
    <td>program</td>
  </tr>
  <tr>
    <td>PATH</td>
    <td>program</td>
  </tr>
  <tr>
    <td>PARENT</td>
    <td><a href="../">VCFG</a></td>
  </tr>
  <tr>
    <td rowspan="0">FIELDS</td>
    <td><a href="binary">binary</a></td>
  </tr>
  <tr>
    <td><a href="args">args</a></td>
  </tr>
  <tr>
    <td><a href="env">env</a></td>
  </tr>
  <tr>
    <td><a href="stdout">stdout</a></td>
  </tr>
  <tr>
    <td><a href="stderr">stderr</a></td>
  </tr>
  <tr>
    <td><a href="bootstrap">bootstrap</a></td>
  </tr>
  <tr>
    <td><a href="cwd">cwd</a></td>
  </tr>
  <tr>
    <td><a href="strace">strace</a></td>
  </tr>
  <tr>
    <td><a href="privilege">privilege</a></td>
  </tr>
</table>

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
```

## CLI Flags

As a repeatable section, CLI flags to fields contained within this section must be referenced with an index defining which program the flag applies to. All flags have the form `--program[N].field`, where N is a number identifying which program.
