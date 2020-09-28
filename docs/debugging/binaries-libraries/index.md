---
title: Binaries & libraries
nav_order: 2
has_children: false
layout: default
parent: Debugging
---

# Binaries & libraries

This guide describes how to debug an application on Vorteil that may be behaving unexpectedly. Undesirable behaviour can be the result of incorrect/missing shared object libraries. While tools such as the Vorteil CLI provide an easy method of gathering shared objects (`$ vorteil projects import-shared-objects ...`), some shared dependencies only become apparent during runtime (for example, DNS resolution via `libresolv.so`).

 In these situations, it can be useful to use the `strace` tool for debugging purposes. To enable `strace`, adjust the `[[program]]` block that defines your application:

```toml
[[program]]
  binary = "/app"
  args = "-arg1 -arg2"
  strace = true
```
