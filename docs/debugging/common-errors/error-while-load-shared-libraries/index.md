---
title: Error while loading shared libraries
nav_order: 3
layout: default
has_children: false
parent: Common errors
grand_parent: Debugging
---

# Error while loading shared libraries

## Symptom

Your application fails almost immediately, and you see a log resembling the following to the application's output:

```sh
/app: error while loading shared libraries: libc.so.6: cannot open shared object file: No such file or directory
```

*Note: Note that "libc.so.6" is a specific example, but the error is the same for any other file.*

## Cause

The linker loaded by the kernel to perform the linking was not able to find one of the shared object files needed by the program on the file-system.

## Solution

Copy the missing shared object onto the filesystem for the Vorteil app at an appropriate path. You need to determine the location of the missing file on your system then copy that file and [add it to your Vorteil app](/docs/concepts/shared-objects/) so that it appears on the same absolute path on the app as it was on your Linux machine. For example, if you sourced `libc.so.6` from `/lib64/libc.so.6` on your Linux machine it must appear at `/lib64/libc.so.6` on your app.
