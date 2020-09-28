---
title: Shared objects
nav_order: 4
has_children: false
layout: default
parent: Concepts
---

# Shared objects

Not all programs are compiled as monolithic binaries. It is common practice to rely on "shared objects": libraries of code that have been compiled as standalone chunks of logic that are available for other software to use. Programs that make use of shared objects work just fine on Vorteil, but it is important that package developers include their dependencies in the appropriate place within the package.

## The Linker

Every program that relies on shared objects requires a special tool called a "linker" to load the shared object. If you run such a program on Vorteil without the linker you'll see an error similar to the following message:

```
can not find linker: /lib64/ld-linux-x86-64.so.2
```

If you see this error all you need to do to fix it is to copy the missing linker file into your package.


## Shared Objects

If you omit a critical shared object from your package you should generally expect the app to fail immediately with a message similar to the following example:

```
/app: error while loading shared libraries: libc.so.6: cannot open shared object file: No such file or directory
```

Fix this error by copying the missing shared object from your system into the package. The exact location of a shared object varies from distribution to distribution, but a search through the "/lib64" and "/lib" directories will usually turn up the file you're looking for.

## Dynamic Loading

Shared objects aren't necessarily loaded immediately when launching an app. Sometimes they're only loaded when their logic is first needed. Shared objects loaded dynamically in this way are sometimes harder to identify, but the solution is the same: locate the shared object on your system and copy it into the package at the appropriate location.

## Compatibility

Programs that make use of shared objects are typically compiled in the presence of those shared objects. This allows the compiler to correctly match them up and make them compatible. The best way to ensure that a shared object is compatible with a program is to source it from the same system that compiled the program.

Since Vorteil only supports Linux binaries all shared objects need to be for Linux. Specifically, 64-bit x86 Linux. Similar standards such as Dynamic Link Libraries (DLLs) are not useful to a Vorteil app.