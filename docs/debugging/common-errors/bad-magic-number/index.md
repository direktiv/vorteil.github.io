---
title: Mad magic number
nav_order: 1
layout: default
has_children: false
parent: Common errors
grand_parent: Debugging
---

# Bad magic number

## Symptom

Unable to build, package or provision the Vorteil project, due to a `bad magic number` error.

## Cause

The binary being called by the VCFG file is not an ELF64/32-bit binary.

## Solution

Ensure that the target of the `binary = ""` field within the project `.vcfg` file is an ELF-64 or 32-bit binary. Shell scripts, Mac binaries, and Windows Executable files are not supported.
