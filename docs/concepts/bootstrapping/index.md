---
title: Bootstrapping
nav_order: 3
has_children: false
layout: default
parent: Concepts
---

# Bootstrapping

Non-Vorteil solutions typically run shell scripts to setup and configure themselves. Generally speaking, setting up and configuring a Vorteil app should be done before it is packaged up so that it is ready to run as soon as it powers on as a VM. This isn't always practical, however. So how does Vorteil address these problems?

It is possible to run a full shell environment on Vorteil, but that comes with a great deal of baggage and makes the solution far more complicated than it normally needs to be. It's also possible to write a custom program to act like a script, but for some common problems that can be overkill. To solve some common problems, Vorteil supports a small selection of "bootstrap instructions".

You can think of bootstrap instructions like a very basic scripting engine. Instructions can be chained one-after-the-other by providing a list of instruction strings in a VCFG in the 'program.N.bootstrap' field. Each 'program' runs in its own thread and runs its bootstrap instructions independently of any others.

All bootstrap instructions in a list will complete before the program is executed. Any errors that occur during the bootstrap step will be treated as critical errors and cause the entire VM to terminate.

## Instructions

### SLEEP

The SLEEP instruction causes the launcher thread to pause for the specified duration before proceeding.

```
SLEEP <duration>

Arguments:
	duration	Number of milliseconds to sleep.

VCFG Example:

	[[program]]
	  bootstrap = ["SLEEP 1000"] # Sleep for one second.
```

### FIND_AND_REPLACE

The FIND_AND_REPLACE instruction modifies the contents of a file by performing a find-and-replace operation on its entire contents.

```
FIND_AND_REPLACE find=<key> replace=<value> file=<path>

Arguments:
	key 	String to search for matches.
	value   Replace matched key strings with this value.
	path	Path to a file to perform the find-and-replace on.

VCFG Example:

	[[program]]
	  bootstrap = ["FIND_AND_REPLACE find=bind_ip replace=$IP0 file=/conf.toml"] # Replace "bind_ip" with the value of the IP0 environment variable in "/conf.toml".
```

### DEFINE_IF_NOT_DEFINED

The DEFINE_IF_NOT_DEFINED instruction checks if the launcher thread has the named environment variable. If the variable hasn't been defined, it will be defined and initialized to the provided value. If the variable has already been defined, this instruction does nothing: it does not overwrite existing variables.

```
DEFINE_IF_NOT_DEFINED <key> <value>

Arguments:
	key     Environment variable to define.
	value   Default value for the environment variable.

VCFG Example:

	[[program]]
	  bootstrap = ["DEFINE_IF_NOT_DEFINED PEER $EXT_IP0"] # Set the "PEER" environment variable to the external IP address of this computer, if it hasn't already been defined.
```

### WAIT_FILE

The WAIT_FILE instruction will wait for the specified file to exist before the program will be executed.

```
WAIT_FILE <value>

Arguments:
	value	Absolute file path

VCFG Example:

	[[program]]
	  bootstrap = ["WAIT_FILE /path/to/my/file"] # wait until /path/to/my/file exists before running program
```

### WAIT_PORT

The WAIT_PORT instruction will wait for the specified port(s) to become available on a network interface before the program will be executed.

```
WAIT_PORT [network_interface] <value>...

Arguments:
	value	Port number

VCFG Example:

	[[program]]
	  bootstrap = ["WAIT_PORT if=eth0 8080"] # wait for port 8080 to become available on interface eth0
```