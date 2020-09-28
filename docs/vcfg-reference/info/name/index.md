---
title: name
nav_order: 4
layout: default
parent: info
grand_parent: VCFG Reference
---

# name

The `name` field provides a name for the package or app. This name can include spaces, punctuation, and special characters without any issues. It should not generally include version numbers as they can be set in the version field.

The name of an app should reflect the function of the app, not the name of the binary itself. In many cases the two are one-and-the-same, but in many other cases it is the contents of the app’s file-system that determine its behaviour and differentiate it from other apps that may well use exactly the same binary.

## Summary

```
FIELD       name
PATH        info.name
PARENT      info
TYPE        String
DEFAULT     ""
```

## Example

```toml
[info]
  name = "My App"
```

## CLI Flag

```
--info.name="My App"
```