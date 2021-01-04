---
title: Projects
nav_order: 3
has_children: false
layout: default
parent: Concepts
---

# Projects

A project is a directory containing files and directories that will be copied to create an app's file-system, as well as all other components that are necessary to produce a [package](../packages/). Projects are designed to support rapid iteration, allowing developers to develop and test their solutions fluidly before locking them down into a package for distribution.

In many ways a project can be thought of as an open package: building images and running virtual machines is just as easy with one as with the other. The Vorteil Server APIs and tools have been created so that a project is interchangeable with a package in most circumstances.

## The Project File

To be used as a project a directory must contain a TOML file named ".vorteilproject". The project file serves two purposes:

- It marks the root directory of the project.
- It explicitly outlines which files are used as various components.

The structure of a project file consists of an optional list of glob patterns to ignore and at least one project "target". A target must provide the bare minimum amount of information needed to assemble an app: the name of a VCFG that specifies what to use as the app's binary.

Here is an example of what a valid project file might look like at its simplest:

```toml
[[target]]
  vcfgs = ["app.vcfg"]
```

In this example, "app.vcfg" might contain the following:

```toml
[[program]]
  binary = "app"
  ```

The project directory would therefore need to contain at least the following three files:

```
.vorteilproject 	
app
app.vcfg
```

## Targets

Each target can have the following fields: name, vcfgs, files, and icon. The VCFG files and the files or folders specified in the "files" field will be merged into the app during compile-time. It is possible to have targets produce apps with very different behaviour using these fields, but the reason these fields exist is so that minor variations are easy to manage.

For example, your app may need slightly different settings running on your local development environment than it will need when running in production. Using targets you can have a single project that can easily be built with slightly different VCFGs or on-disk config files suited to their environment. This way, most major changes you make will apply to both targets.

Although projects are generally interchangeable with packages, and although packages can be unpacked into projects, it is important to note that a package file is always built from a single specific project target. Packages do not remember the targets of the project they came from. If you want to transport a project you should use a generic ZIP or TAR archive.