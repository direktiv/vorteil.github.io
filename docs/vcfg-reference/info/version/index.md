---
title: version
nav_order: 7
layout: default
parent: info
grand_parent: VCFG Reference
---

# version

The `version` field can contain any type of version identifying string required. None of Vorteil’s tools attempt to parse or process this value, it exists purely as a human-readable version.

## Summary

```
FIELD       version
PATH        info.version
PARENT      info
TYPE        String
DEFAULT     ""
```

## Example

```toml
[info]
  version = "1.0.0"
```

## CLI Flag

```
--info.version="1.0.0"
```