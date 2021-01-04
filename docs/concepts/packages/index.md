---
title: Packages
nav_order: 4
has_children: false
layout: default
parent: Concepts
---

# Packages

A package is an archive containing everything necessary to produce and reproduce identical copies of an app. Software solutions for Vorteil are generally stored and transported as package files instead of pre-compiled virtual machine disk images. There are many reasons for this:

- Packages are compressed and take less space than image files.
- Packages can be converted into any virtual machine image file format on demand.
- Packages can be unpacked for easy access to their contents, making them easier to modify.
- Packages provide a standardized format that can be probed for descriptive information about their contents and purpose.
- Packages can benefit from kernel and compiler updates without any modification by developers, making them easier to maintain.

Compared to other archive formats such as ZIP archives and tarballs, they are specialized to minimize the effort required for probing their contents, and they are optimized to minimize build times.

A package represents a single product, or often-times a standalone part of a bigger product in the case of a micro-service. A package should usually be trusted to run correctly on any environment, which makes developing and deploying portable apps easy. From a package, our tools can build virtual machine disk images, provision virtual machines, and run those same VMs. These processes require no human intervention, and typically happen in a remarkably short amount of time.

Packages should also contain lots of helpful information about themselves so that our tools can perform some amount of intelligent configuration when building or running them. Users should be able to learn everything they need to know about what a package does and how to use it from this information.

## Contents of a Package

Packages generally contain all of the following components:

- Files for the App's file-system
- The Program
- Kernel behaviour settings
- Recommended system requirements
- Metadata describing the purpose and function of the package
- An icon or thumbnail representing the package

Packages are usually developed from [projects](../projects/).
