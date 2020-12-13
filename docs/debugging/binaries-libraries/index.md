---
title: Binaries & libraries
nav_order: 2
has_children: false
layout: default
parent: Debugging
---

# Binaries & libraries

## Using strace

This guide describes how to debug an application on Vorteil that may be behaving unexpectedly. Undesirable behaviour can be the result of incorrect/missing shared object libraries. While tools such as the Vorteil CLI provide an easy method of gathering shared objects (`$ vorteil projects import-shared-objects ...`), some shared dependencies only become apparent during runtime (for example, DNS resolution via `libresolv.so`).

 In these situations, it can be useful to use the `strace` tool for debugging purposes. To enable `strace`, adjust the `[[program]]` block that defines your application:

```toml
[[program]]
  binary = "/app"
  args = "-arg1 -arg2"
  strace = true
```

## Shared objects in non-standard locations

The `import-shared-objects` command takes most of the effort out of finding and importing any shared objects that a Vorteil project depends on, but it's not bulletproof. Despite running `vorteil projects import-shared-objectsr`', it is possible that an app will be unable to locate all of the shared objects it requires even if they do exist inside the project directory. Luckily, this is usually quite a simple issue to resolve.

If an app is unable to locate certain shared objects, the following output (for example) might be observed:

```sh
Failed to open dedicated.so (dedicated.so: cannot open shared object file: No such file or directory)
```

The first step is to confirm that the missing shared object is located within the project directory.
```sh
$ cd $PROJECT_DIR
$ find ./ | grep dedicated.so
./csgo-ds/bin/dedicated.so
```

Running a `find` operation shows that the missing shared object is located within the `csgo-ds/bin` directory inside of the project. Simply take this path and add the `LD_LIBRARY_PATH` environment variable to the affected `[[program]]` within the project .vcfg file:

```toml
[[program]]
  binary = "/path/to/my/binary"
  args   = "args go here"
  env    = ["LD_LIBRARY_PATH=/csgo-ds/bin"]
```

*Note: Additional fields can be added to the LD_LIBRARY_PATH environment variable using : as a delimiter. For example: `LD_LIBRARY_PATH=/csgo-ds/bin:/test/bin`*

Run the app again an observe the results. It may be necessary to repeat this process a number of times before all dependencies have been properly located.
