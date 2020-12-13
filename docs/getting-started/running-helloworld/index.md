---
title: Running "Hello World"
nav_order: 2
has_children: false
layout: default
parent: Getting Started
---

# Running "Hello World"

To make life easier we host a public repository of ready-to-use Vorteil packages. These packages are used for demonstration and tutorial purposes only and should not be used in production. You can download these packages and modify for production use if you want to. In this example you'll be running our Hello World package from the public repository.

```sh
$ vorteil run https://apps.vorteil.io/file/vorteil/helloworld
```

This command downloads our Hello World package from [apps.vorteil.io](https://apps.vorteil.io) and runs it using one of your local hypervisors.

Our Hello World app is a simple web server that should be reachable via NAT on port 8888 (http://localhost:8888/). If that port was unavailable you should notice a yellow warning message in the logs telling you which port it bound instead.

```sh
$ vorteil run https://apps.vorteil.io/file/vorteil/helloworld
Downloading package done [============================================================================] 4.0 MiB / 4.0 MiB
Planning file-system  ⠇                                                                                
Initializing vmdk image file  ⠧                                                                                
Writing image done [==============================================================================] 34.0 MiB / 34.0 MiB
Preparing VirtualBox machine  ⠼                                                                                
Network settings
 • http:8888
[    0.237322] sd 0:0:0:0: [sda] Incomplete mode parameter data
[    0.239725] sd 0:0:0:0: [sda] Assuming drive cache: write through
[0.510000] #vorteil-20.11.1 (581f486) SMP 22-11-2020 (Linux version 5.9.6+)
[0.580000] eth0 ip	: 10.0.2.15
[0.580000] eth0 mask	: 255.255.255.0
[0.580000] eth0 gateway	: 10.0.2.2
[0.580000] dns		: 192.168.1.1, 8.8.8.8
No background color set in BACKGROUND environment variable
Binding port: 8888
```

The Hello World app will run indefinitely, if allowed to. When you’re finished with it you can shut it down by sending an interrupt signal: press `CTRL-C` and the shutdown will commence. The virtual machine will be cleaned up as if it never existed.

Using the `vorteil run` command and the name of the package from [apps.vorteil.io](https://apps.vorteil.io), any of the demo packages can be run. Simply replace the "helloworld" string in the url with the name of the package you want to run (highlighted in a blue box on the image below):

![apps.vorteil.io](/assets/getting-started/running-helloworld/apps.png)
