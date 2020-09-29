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

When performing Vorteil tasks that result in a disk or virtual machine being created, provide the `--shell` flag to enable shell-mode.

```
$ vorteil run <RUNNABLE> --shell
```