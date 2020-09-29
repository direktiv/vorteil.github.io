---
title: Java
nav_order: 3
has_children: false
layout: default
parent: Running your own application
grand_parent: Getting Started
---

# Starting a Java project

In this quickstart guide we’ll show you how to start a project based on Java.

## Before you start

Please make sure you have Vorteil and at least one [supported hypervisor](/docs/guides/configure-virtualizer/) installed.

## Java public repository application

This guide isn’t meant to be an introduction to Java, but there a few things you’ll need to do to follow along. We’ll take you through all the steps you need to run this Java’s Hello World tutorial.

Let’s start by fetching our standalone public application for Java and extracting it into a folder.

```
$ vorteil unpack https://apps.vorteil.io/file/vorteil/java18 ./java18/
$ cd java18/
$ ls -A
default.png  default.vcfg  etc  java   jdk1.8.0_172  lib  lib64  .vorteilproject
```

The “-A” flag instructs the ls tool to show hidden files, which is helpful here because the one file created from the unpack which is hidden on Mac and Linux.

We will now be working from java18 directory from now on.

```
$ vorteil run
Preparing VM [============================================================================================================================] 100.00% 2s
Warning: VM has network cards but no defined ports (hypervisor=kvm, vm=java18-ymji)
[    0.530000]  #vorteil-19.10.1 (59f7d8610) SMP 10-10-2019 (Linux version 5.2.20+)
[    0.540000]  ip: 10.0.2.15
[    0.540000]  mask: 255.255.255.0
[    0.540000]  gateway: 10.0.2.2
[    0.540000]  dns: 10.0.2.3, 8.8.8.8, 8.8.4.4
java version "1.8.0_172-ea"
Java(TM) SE Runtime Environment (build 1.8.0_172-ea-b03)
Java HotSpot(TM) 64-Bit Server VM (build 25.172-b03, mixed mode)
[    0.600000]  [0] returned with exit status: 0
[    0.600000]  no programs still running
[    0.650000]  shutting down in 3...
[    1.649999]  shutting down in 2...
[    2.660000]  shutting down in 1...
```

This app is configured to print out the Java version and then exit.

## Editing the application to make it print 'Hello World'

Create the file 'Helloworld.java' with the following java code:

```java
public class HelloWorld {

    public static void main(String[] args) {
        // Prints "Hello, World" to the terminal window.
        System.out.println("Hello, World");
    }

}
```

Java can’t run this application yet as it is uncompiled code. We need to use ‘javac’ which is located in ‘jdk1.8.0_172/bin/javac’ of the package filesystem.

```
$ jdk1.8.0_172/bin/javac HelloWorld.java
```

If the above command fails you may need to chmod +x the binary.

```
$ chmod +x jdk1.8.0_172/bin/javac
```

You will now find that a HelloWorld.class has been created.

To edit the application and change how it is run we first need to change the VCFG details. We need to change the args of the VCFG from ‘-version’ to ‘HelloWorld’. As Java does not need to know the extension of the file naming it ‘HelloWorld’ will work.

```toml
[[program]]
  binary = "/jdk1.8.0_172/bin/java"
  args = "HelloWorld"

[[network]]
  ip = "dhcp"

[system]
  dns = ["8.8.8.8", "8.8.4.4"]
  max-fds = 1024
  output-mode = "standard"
```

## Closing notes

This shows that we could easily create our own java class that we can plug and play running on Vorteil.

After making these changes we can try running the application using Vorteil again.

```
$ vorteil run
[    0.500000]  #vorteil-19.10.1 (59f7d8610) SMP 10-10-2019 (Linux version 5.2.20+)
[    0.510000]  ip: 10.0.2.15
[    0.510000]  mask: 255.255.255.0
[    0.510000]  gateway: 10.0.2.2
[    0.510000]  dns: 10.0.2.3, 8.8.8.8, 8.8.4.4
Hello, World
[    0.580000]  [0] returned with exit status: 0
[    0.580000]  no programs still running
[    0.650000]  shutting down in 3...
[    1.649999]  shutting down in 2...
[    2.649999]  shutting down in 1...
[    3.668480] reboot: Power down
```

This should provide you with the stepping stones to further develop more complex applications to run on Vorteil. As compiling your own Java classes to plug and play with the java binary shows how easy it can be.