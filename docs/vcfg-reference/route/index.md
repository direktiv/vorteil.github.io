---
title: route
nav_order: 8
has_children: true
layout: default
parent: VCFG Reference
has_toc: false
---

# route

The repeatable `route` section of a VCFG is dedicated to defining custom routing table rules for the app.

## Summary

<table class="table summary">
  <tr>
    <td class="key-column">REPEATABLE SECTION</td>
    <td>route</td>
  </tr>
  <tr>
    <td>PATH</td>
    <td>route</td>
  </tr>
  <tr>
    <td>PARENT</td>
    <td><a href="../">VCFG</a></td>
  </tr>
  <tr>
    <td rowspan="0">FIELDS</td>
    <td><a href="destination">destination</a></td>
  </tr>
  <tr>
    <td><a href="gateway">gateway</a></td>
  </tr>
  <tr>
    <td><a href="interface">interface</a></td>
  </tr>
</table>

## Example

```toml
[[route]]
  destination = "10.0.1.0/24"
  gateway = "192.168.1.253"
  interface = "eth0"
```

## CLI Flags

As a repeatable section, CLI flags to fields contained within this section must be referenced with an index defining which route the flag applies to. All flags have the form `--route[N].field`, where N is a number identifying which route. 
