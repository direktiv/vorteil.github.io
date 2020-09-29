---
title: network
nav_order: 4
has_children: true
layout: default
parent: VCFG Reference
has_toc: false
---

Customizing an app’s `network` configuration is perhaps the most common and most critical thing to do in Vorteil. By default an app will generally be customized for a single network interface using DHCP, but fine-grained control is very commonly required. The repeatable "network" section of a VCFG is dedicated to such information.

## Summary

<table class="table summary">
  <tr>
    <td class="key-column">REPEATABLE SECTION</td>
    <td>network</td>
  </tr>
  <tr>
    <td>PATH</td>
    <td>network</td>
  </tr>
  <tr>
    <td>PARENT</td>
    <td><a href="../">VCFG</a></td>
  </tr>
  <tr>
    <td rowspan="0">FIELDS</td>
    <td><a href="disable-tso">disable-tso</a></td>
  </tr>
  <tr>
    <td><a href="gateway">gateway</a></td>
  </tr>
  <tr>
    <td><a href="http">http</a></td>
  </tr>
  <tr>
    <td><a href="https">https</a></td>
  </tr>
  <tr>
    <td><a href="ip">ip</a></td>
  </tr>
  <tr>
    <td><a href="mask">mask</a></td>
  </tr>
  <tr>
    <td><a href="mtu">mtu</a></td>
  </tr>
  <tr>
    <td><a href="tcp">tcp</a></td>
  </tr>
  <tr>
    <td><a href="udp">udp</a></td>
  </tr>
  <tr>
    <td><a href="tcpdump">tcpdump</a></td>
  </tr>
</table>

## Example

```toml
[[network]]
  disable-tso = false
  gateway = ""
  http = ["80"]
  https = ["443"]
  ip = "dhcp"
  mask = ""
  mtu = 1500
  tcp = []
  udp = []
  tcpdump = false
```