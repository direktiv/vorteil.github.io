---
title: Configuring a project
nav_order: 3
has_children: false
layout: default
parent: Guides
---

# Configure a project

A Vorteil project is simply a directory containing a `.vorteilproject` file which contains information that defines rules such as:

 - which `.vcfg` file(s) should be used from within this directory when building
 - which files should be ignored (not built in to the filesystem) when building
 - which file should be used as the 'package icon' (eg. the icons seen for apps on the [apps.vorteil.io](https://apps.vorteil.io/))

## Example: .vorteilproject file

 The contents of a generic `.vorteilproject` file can appear as follows:

```toml
ignore = [".vorteilproject"]

[[target]]
  name = "default"
  vcfgs = ["default.vcfg"]
  icon = "default.png"
```

In this example, there exists only one 'build target': `default`. We are able to add another build target, which can shape the package that the project creates:

```toml
ignore = [".vorteilproject"]

[[target]]
  name = "default"
  vcfgs = ["default.vcfg"]
  icon = "default.png"

[[target]]
  name = "custom"
  vcfgs = ["default.vcfg", "readme.vcfg"]
  icon = ""
```

Now, when building with the `custom` build target, both "default.vcfg" and "readme.vcfg" will be used and no icon will be set. We can instruct the Vorteil CLI to build using the `custom` target by running the following:

```sh
vorteil pack my/project/dir:custom
```

