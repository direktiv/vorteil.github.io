---
title: Device or resource busy
nav_order: 2
layout: default
has_children: false
parent: Common errors
grand_parent: Debugging
---

# Device or resource busy

## Symptom

The application is unable to resolve domain names, and therefore cannot perform successful requests to other domains.

## Cause

The application is missing some shared objects required for DNS functionality. Applications do not necessarily list a dependency on these libraries; this means that the built-in Vorteil feature "Import Shared Objects" (or `vorteil projects import-shared-objects` in the CLI) will not gather these files.

## Solution

Copy the missing shared objects into the `/lib` directory on the application filesystem. These files include:
- `libnss_dns.so.2`
- `libnss_files.so.2`
- `libresolv.so.2`
