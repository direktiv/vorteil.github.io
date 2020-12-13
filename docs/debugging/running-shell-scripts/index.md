---
title: Running shell scripts
nav_order: 1
has_children: false
layout: default
parent: Debugging
---

# Running shell scripts

A lot of pre-existing applications rely on shellscripts to launch properly, which has the potential to make things difficult when attempting to port them to a Vorteil application. To counter this problem, "shell-mode" was created.


## What is "shell-mode"?

Shell-mode is a feature that can be used to enable users to execute shell scripts the same way they would run any executable binary. When shell-mode is being used, Vorteil machines are built with BusyBox providing access to a range of Unix utilities including `ls`, `mkdir`, `sh`, `stat`, and many more. Because BusyBox provides access to sh, Vorteil is able to execute any shell scripts provided in the binary field of a `[[program]]` as long as it bares the appropriate shebang: `#!/bin/sh`. A full list of commands provided by Busybox can be found [here](https://en.wikipedia.org/wiki/BusyBox#Commands).

## Usage

Let's create a shell script which runs a couple of basic commands and save it as `shell-cmds.sh`:

```sh
#!/bin/sh

ping -c 3 8.8.8.8
sleep 5
ifconfig -a
sleep 5
ls /
```

In the Vorteil configuration file for the project (example, `default.vcfg`), add the following decleration:

```toml
[[program]]
  binary = "shell-cmds.sh"

[[program]]
  binary="/minio"
  args="server --config-dir /data /data"

[[network]]
  http = ["9000"]
  ip = "dhcp"

[vm]
  cpus = 1
  ram = "1024 MiB"
  disk-size = "+1 GiB"
```

When performing Vorteil tasks that result in a disk or virtual machine being created, provide the `--shell` flag to enable shell-mode.

```sh
$ vorteil run <RUNNABLE> --shell
```

Example output is shown below:
```sh
$ vorteil run . --shell
Planning file-system  ⠋                                                                                
Initializing vmdk image file  ⠋                                                                                
Writing image done [==============================================================================] 1.1 GiB / 1.1 GiB
Preparing VirtualBox machine  ⠴                                                                                
Network settings
 • http:9000
[    0.250543] sd 0:0:0:0: [sda] Incomplete mode parameter data
[    0.255240] sd 0:0:0:0: [sda] Assuming drive cache: write through
[0.540000] #vorteil-20.11.1 (581f486) SMP 22-11-2020 (Linux version 5.9.6+)
[0.600000] eth0 ip	: 10.0.2.15
[0.600000] eth0 mask	: 255.255.255.0
[0.600000] eth0 gateway	: 10.0.2.2
[0.600000] dns		: 192.168.1.1, 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: seq=0 ttl=63 time=7.144 ms
64 bytes from 8.8.8.8: seq=1 ttl=63 time=7.811 ms
64 bytes from 8.8.8.8: seq=2 ttl=63 time=7.038 ms

--- 8.8.8.8 ping statistics ---
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max = 7.038/7.331/7.811 ms
Endpoint:  http://10.0.2.15:9000  http://127.0.0.1:9000    

Browser Access:
   http://10.0.2.15:9000  http://127.0.0.1:9000    

Object API (Amazon S3 compatible):
   Go:         https://docs.min.io/docs/golang-client-quickstart-guide
   Java:       https://docs.min.io/docs/java-client-quickstart-guide
   Python:     https://docs.min.io/docs/python-client-quickstart-guide
   JavaScript: https://docs.min.io/docs/javascript-client-quickstart-guide
   .NET:       https://docs.min.io/docs/dotnet-client-quickstart-guide
Detected default credentials 'minioadmin:minioadmin', please change the credentials immediately using 'MINIO_ACCESS_KEY' and 'MINIO_SECRET_KEY'
eth0      Link encap:Ethernet  HWaddr 08:00:27:C0:CC:EA  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fec0:ccea/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:27 errors:0 dropped:0 overruns:0 frame:0
          TX packets:32 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:12579 (12.2 KiB)  TX bytes:3307 (3.2 KiB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:8 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:694 (694.0 B)  TX bytes:694 (694.0 B)

bin
certs
data
default.vcfg
dev
etc
minio
proc
sbin
shell-cmds.sh
sys
tmp
usr
vorteil
[20.410000] shutting down applications
[20.420000] shutting down in 3...
[21.420000] shutting down in 2...
[22.420000] shutting down in 1...
[   23.421892] sysrq: Emergency Sync
[   23.424808] sysrq: Emergency Remount R/O
[   23.427293] reboot: Power down
$
```
