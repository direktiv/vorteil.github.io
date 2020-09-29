---
title: vm
nav_order: 3
has_children: true
layout: default
parent: VCFG Reference
has_toc: false
---

# vm

The `vm` section of a VCFG provides recommendations used by users and deployment tools pertaining to the amount of resources that should be allocated to the app.

## Summary

<table class="table summary">
  <tr>
    <td class="key-column">SECTION</td>
    <td>vm</td>
  </tr>
  <tr>
    <td>PATH</td>
    <td>vm</td>
  </tr>
  <tr>
    <td>PARENT</td>
    <td><a href="../">VCFG</a></td>
  </tr>
  <tr>
    <td rowspan="0">FIELDS</td>
    <td><a href="cpus">cpus</a></td>
  </tr>
  <tr>
    <td><a href="disk-size">disk-size</a></td>
  </tr>
  <tr>
    <td><a href="inodes">inodes</a></td>
  </tr>
  <tr>
    <td><a href="kernel">kernel</a></td>
  </tr>
  <tr>
    <td><a href="ram">ram</a></td>
  </tr>
</table>

## Example

```toml
[vm]
  cpus = 1
  disk-size = "64 MiB"
  inodes = 1024
  kernel = "1.0.0"
  ram = "256 MiB"
```