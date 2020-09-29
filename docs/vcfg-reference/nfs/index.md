---
title: nfs
nav_order: 7
has_children: true
layout: default
parent: VCFG Reference
has_toc: false
---

The repeatable `nfs` section of a VCFG is dedicated to defining an NFS mount for the app.

## Summary

<table class="table summary">
  <tr>
    <td class="key-column">REPEATABLE SECTION</td>
    <td>nfs</td>
  </tr>
  <tr>
    <td>PATH</td>
    <td>nfs</td>
  </tr>
  <tr>
    <td>PARENT</td>
    <td><a href="../">VCFG</a></td>
  </tr>
  <tr>
    <td rowspan="0">FIELDS</td>
    <td><a href="mount">mount</a></td>
  </tr>
  <tr>
    <td><a href="server">server</a></td>
  </tr>
  <tr>
    <td><a href="options">options</a></td>
  </tr>
</table>

## Example

```toml
[[nfs]]
  mount = "/mountpoint"
  server = "192.168.1.10"
  options = "vers=4.2,rw"
```

## CLI Flags

As a repeatable section, CLI flags to fields contained within this section must be referenced with an index defining which NFS mount the flag applies to. All flags have the form `--nfs[N].field`, where N is a number identifying which mount.
