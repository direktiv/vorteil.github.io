---
title: Running "Hello World"
nav_order: 1
has_children: false
layout: default
parent: Getting Started
---

# Running "Hello World"

```sh
vorteil run https://apps.vorteil.io/file/vorteil/helloworld
```

This command downloads our Hello World package from apps.vorteil.io and runs it using one of your local hypervisors.

Our Hello World app is a simple web server that should be reachable via NAT on port 8888 (http://localhost:8888/). If that port was unavailable you should notice a yellow warning message in the logs telling you which port it bound instead.