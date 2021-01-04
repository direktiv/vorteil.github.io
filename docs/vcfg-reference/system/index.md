---
title: system
nav_order: 5
has_children: true
layout: default
parent: VCFG Reference
has_toc: false
---

# system

The `system` section of a VCFG is dedicated to advanced settings effecting the app’s runtime.

## Summary

<table class="table summary">
  <tr>
    <td class="key-column">SECTION</td>
    <td>system</td>
  </tr>
  <tr>
    <td>PATH</td>
    <td>system</td>
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
    <td><a href="dns">dns</a></td>
  </tr>
  <tr>
    <td><a href="hostname">hostname</a></td>
  </tr>
  <tr>
    <td><a href="max-fds">max-fds</a></td>
  </tr>
  <tr>
    <td><a href="ntp">ntp</a></td>
  </tr>
  <tr>
    <td><a href="output-mode">output-mode</a></td>
  </tr>
  <tr>
    <td><a href="kernel-args">kernel-args</a></td>
  </tr>
  <tr>
    <td><a href="filesystem">filesystem</a></td>
  </tr>
  <tr>
    <td><a href="user">user</a></td>
  </tr>
  <tr>
    <td><a href="terminate-wait">terminate-wait</a></td>
  </tr>
</table>

## Example

```toml
[system]
  dns = ["1.1.1.1", "1.0.0.1"]
  hostname = "myapp"
  max-fds = 1024
  ntp = ["0.au.pool.ntp.org", "1.au.pool.ntp.org"]
  output-mode = "standard"
  filesystem = "ext2"
  user = "vorteil"
  terminate-wait = 3000
```