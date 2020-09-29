---
title: Python
nav_order: 5
has_children: false
layout: default
parent: Running your own application
grand_parent: Getting Started
---

# Starting a Python project

In this quickstart guide, we’ll show you how to run a simple Python script using Vorteil, some detail on the Vorteil configuration file and how to get started adding your own scripts.

## Before you start

Please make sure you have Vorteil and at least one [supported hypervisor](/docs/guides/configure-virtualizer/) installed.

## Getting Python for Vorteil

This guide isn’t meant to be an introduction to Python, but there are a few things you’ll need to do to follow along. Let’s start by fetching our standalone application for Python and extracting it into a folder.

```
$ vorteil unpack https://apps.vorteil.io/file/vorteil/python3 ./python3/
$ cd python3
```

Following the operations successful completion, you will have the python3 package. The Vorteil Python package is a pre-configured Vorteil project that comes bundled with a built python 3 and a simple Python script “hello.py” that prints “Hello World!”.

## Run the Python application

First let’s run our newly exported package using the power of Vorteil. Everything has come pre-configured to use the included python Python 3 ELF binary and run the included hello.py script so all we have to do is run the following command while inside the projects directory:

```
vorteil run
```

You should see something similar to what is shown below:

```
[    0.510000]  #vorteil-19.10.1 (59f7d8610) SMP 10-10-2019 (Linux version 5.2.20+)
[    0.570000]  ip: 10.0.2.15
[    0.570000]  mask: 255.255.255.0
[    0.580000]  gateway: 10.0.2.2
[    0.580000]  dns: 10.0.2.3, 8.8.8.8, 8.8.4.4
Hello World!
[    0.690000]  [0] returned with exit status: 0
[    0.690000]  no programs still running
[    0.760000]  shutting down in 3...
[    1.760000]  shutting down in 2...
[    2.770000]  shutting down in 1...
[    3.775317] reboot: Power down
```

This is the Virtual Machine Log of the entire life cycle of our Vorteil instance. This article will not cover what is occurring on every line of this log, the only relevant lines we’re interested in are lines 6-12. In line 6 we can see the python script “hello.py” running and printing to the “Hello World!” to the screen. In the following two lines can confirm that the Python ELF binary has successfully finished running with no errors, and that the virtual machine is now being shut down.

Now that we have seen Vorteil running a Python script we’ll explain the basics of how this machine has been configured and how to add your own scripts.

## Basic configuration

If we look inside the projects directory there is a Vorteil configuration file or VCFG file named “default.vcfg”. This is where we will configure the Vorteil instance. Please open this file in a text editor of your choice.

There are a lot of pre-configured fields set here already. The only two fields that will be explained in this article are the first two within the `[[program]]` field: `binary` and `args`. For a more in-depth explanation please refer to the [VCFG Reference](/docs/vcfg-reference/).

### The 'binary' field

This field is a mandatory field that points to the path of the desired runtime ELF binary relative to the project folder. In this configuration, we can see since the desired ELF binary is python3.6 and it is located in the root of the project directory. Because of this, we have set the binary field to “/python3.6”.

### The 'args' field

The second field “args” is the argument field of the ELF binary. Since we want to run the “hello.py” script we have set this field to “/hello.py” which is also located in the root of the project directory.

To have a more clear understanding of what is happening here: these first three lines within the VCFG:

```toml
[[program]]
  binary = "/python3.6"
  args = "/hello.py"
```

Are the equivalent of running the following from the terminal on your local machine:

```
$ python3.6 hello.py
```

Now that we understand a little about the configuration file let’s upgrade our Python script to something that takes args. Below is written a new Python script “helloName.py” that given a name in the arguments will print “Hello Name”, if no argument is given the script will simply print “Hello World”.

```py
import sys

def hello():
  if len(sys.argv) >= 2:
    name = sys.argv[1]
  else :
    name = 'World'
  print('Hello', name)

hello()
```

Once the new script has been created, we’ll place it in the root of the project directory beside the “hello.py” script and edit the configuration file.

```toml
[[program]]
  binary = "/python3.6"
  args = "/helloName.py Vorteil"
```

Now, rerun the virtual machine. If everything is working correctly we’ll see the following lines in the Virtual Machine Logs:

```
[    0.500000]  #vorteil-19.10.1 (59f7d8610) SMP 10-10-2019 (Linux version 5.2.20+)
[    0.500000]  ip: 10.0.2.15
[    0.500000]  mask: 255.255.255.0
[    0.500000]  gateway: 10.0.2.2
[    0.500000]  dns: 10.0.2.3, 8.8.8.8, 8.8.4.4
Hello Vorteil
[    0.540000]  [0] returned with exit status: 0
[    0.540000]  no programs still running
[    0.630000]  shutting down in 3...
[    1.629999]  shutting down in 2...
[    2.629999]  shutting down in 1...
[    3.643720] reboot: Power down
```

Using the same logic of changing the script to the new Python script “helloName.py” you can change the args field in the VCFG to run any python script you want.