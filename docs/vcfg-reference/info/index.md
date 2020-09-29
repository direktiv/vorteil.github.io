---
title: info
nav_order: 2
has_children: true
layout: default
parent: VCFG Reference
has_toc: false
---

The info section of a VCFG is dedicated to descriptive metadata that has no impact on the app's function.

## Summary

<table class="table summary">
  <tr>
    <td class="key-column">SECTION</td>
    <td>info</td>
  </tr>
  <tr>
    <td>PATH</td>
    <td>info</td>
  </tr>
  <tr>
    <td>PARENT</td>
    <td><a href="../">VCFG</a></td>
  </tr>
  <tr>
    <td rowspan="0">FIELDS</td>
    <td><a href="author">author</a></td>
  </tr>
  <tr>
    <td><a href="date">date</a></td>
  </tr>
  <tr>
    <td><a href="description">description</a></td>
  </tr>
  <tr>
    <td><a href="name">name</a></td>
  </tr>
  <tr>
    <td><a href="summary">summary</a></td>
  </tr>
  <tr>
    <td><a href="url">url</a></td>
  </tr>
  <tr>
    <td><a href="version">version</a></td>
  </tr>
</table>

## Example

```toml
[info]
  author = "vorteil.io"
  date = "18/04/2019"
  name = "My App"
  url = "vorteil.io"
  version = "1.0.0"
  summary = "My short description."
  description = """My
long
multi-line
description.
"""  
```