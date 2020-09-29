---
title: Networking
nav_order: 3
has_children: false
layout: default
parent: Debugging
---

# Networking

The `tcpdump` feature is a setting that can be enabled on a 'per-network' basis within a Vorteil configuration file. Tcpdump is a powerful packet analyzer for Linux. This tool can aide in the debugging process if, for example, a webserver can not be reached. 

To use tcpdump, set the `tcpdump` field to `true` for the Network being used:

```toml
[[network]]
  ip = "dhcp"
  http = ["8888"]
  tcpdump = true
```

With tcpdump configured to run, your application will display tcpdump output on-screen when it runs. Keep in mind this only captures TCP and UDP traffic. 