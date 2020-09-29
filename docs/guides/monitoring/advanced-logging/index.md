---
title: Advanced logging
nav_order: 1
has_children: false
layout: default
parent: Monitoring
grand_parent: Guides
---

# Advanced logging

In this tutorial we will demonstrate how to configure advanced logging with the integrated fluentbit instance. This feature is only available in the enterprise version of Vorteil.

## What can be logged in Vorteil machines?

There are four log types in Vorteil.

**Kernel messages**

All messages on kernel and Vorteil system level are in this category. During runtime these messages are suppressed. If you want to see these messages on-screen (eg. for debugging) you can change the kernel log-level via VCFG settings or through the command-line:

```
$ vorteil run --system.kernel-args="loglevel=5"
```

**System information**

These logs relate to system hardware (eg. disk/cpu usage).

**Application logs**

Logs all messages written to files specified by the logfiles field in a `[[program]]` configuration.

**Stdout Logs**

Includes all messages printed to stdout on the system, regardless of which `[[program]]` printed it.

**Example: system logging**

This tutorial consists of two parts. The first part describes a basic logging set up, useful for testing. The second part explains more complex application logging. We will use the Tomcat package from the public Vorteil 'apps' repository (https://apps.vorteil.io). Download and extract the package.

```
$ wget -o tomcat.vorteil https://apps.vorteil.io/file/vorteil/tomcat
$ vorteil unpack tomcat.vorteil
```

The following commands will run the Tomcat app:

```
$ cd tomcat
$ vorteil run
```

You can stop the Tomcat app by pressing Ctrl-C.

It's time to configure logging in the default.vcfg file, located within the tomcat directory that was created when you unpacked tomcat.vorteil. Add the following lines to the VCFG file and run Tomcat again:

```toml
[[logging]]
     config = ["Name=tcp", "Host=192.168.1.10", "Port=3000", "Format=json"]
     type = "system"
```

Note that the IP address provided in the 'Host' value should be the IP address of your computer.

When the app is running, you should see a message similar to this:

```
[2019/10/09 05:24:15] [error] [io] TCP connection failed: 192.168.1.10:3000 (Connection refused)
```

This error indicates that there is no server at 192.168.1.10:3000 accepting logs from the Tomcat app. On Linux we can quickly start a TCP listener by executing `netcat -l 3000` in a separate terminal. After a few seconds, new log lines will appear:

```
[{"date":1570599209.000048,"cpu_p":13.000000,"user_p":12.000000,"system_p":1.000000,"cpu0.p_cpu":13.000000,"cpu0.p_user":12.000000,"cpu0.p_system":1.000000},{"date":1570599210.000038,"cpu_p":99.000000,"user_p":93.000000,"system_p":6.000000,"cpu0.p_cpu":99.000000,"cpu0.p_user":93.000000,"cpu0.p_system":6.000000},{"date":1570599211.000217,"cpu_p":89.000000,"user_p":87.000000,"system_p":2.000000,"cpu0.p_cpu":89.000000,"cpu0.p_user":87.000000,"cpu0.p_system":2.000000},{"date":1570599212.000099,"cpu_p":0.000000,"user_p":0.000000,"system_p":0.000000,"cpu0.p_cpu":0.000000,"cpu0.p_user":0.000000,"cpu0.p_system":0.000000},{"date":1570599213.000217,"cpu_p":0.000000,"user_p":0.000000,"system_p":0.000000,"cpu0.p_cpu":0.000000,"cpu0.p_user":0.000000,"cpu0......
```

Now that we've established a basic logging configuration, let's take a more detailed look at the config field of the configuration.

As mentioned previously, an instance of fluentbit is started if logging is enabled within the VCFG. To configure a logging output, refer to fluentbit's output plugin documentation. In this example we are using the TCP output. All parameters mentioned here can be passed in as key/value pairs via the VCFG file.

**Example: application logging**

We can change our logging configuration to monitor application logs by simply changing the logging type from 'system' to 'programs'. This will send all data from specified log files via TCP to TCP to the configured output. This can be easily configured using a program's logfiles field within the VCFG. In this example Tomcat logs into the `/apache-tomcat-9.0.12/logs/` directory, and uses '.log' as the file suffix. To configure our app to capture these files:

```toml
[[program]]
  ...
  logfiles = ["/apache-tomcat-9.0.12/logs/*.log"]

[[logging]]
     config = ["Name=tcp", "Host=192.168.1.10", "Port=3000", "Format=json"]
     type = "programs"
```

Once again, run the app. After a few seconds, the logging output should appear.

This instructs the Vorteil app to log all data from files ending with '.log' in the `/apache-tomcat-9.0.12/logs/` directory. Because this directory is empty on startup, Vorteil will create the files in memory only, and will not create an real files on the filesystem. Once more, start the Tomcat application. Logs from these files should now appear.

**Example: stdout logging**

We can log all messages printed to stdout by setting the logging 'type' to 'stdout'. This will capture any messages printed to stdout, regardless of which program is responsible for them.

```toml
[[logging]]
  config = ["Name=tcp", "Host=192.168.1.10", "Port=3000", "Format=json"]
  type = "stdout"
```