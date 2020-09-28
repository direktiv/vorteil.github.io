---
title: author
nav_order: 1
layout: default
parent: info
grand_parent: VCFG Reference
---

# author

The `author` field identifies the author for the package. The author field should reflect the author of the package, not necessarily the author of the binary itself.

## Summary

```
FIELD       author
PATH        info.author
PARENT      info
TYPE        String
DEFAULT     ""
```

## Example

```toml
[info]
  author = "vorteil.io"
```

## CLI Flag

```
--info.author="vorteil.io"
```