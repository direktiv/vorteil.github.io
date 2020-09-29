---
title: url
nav_order: 6
layout: default
parent: info
grand_parent: VCFG Reference
---

# url

The `url` field can contain a URL to a page with more information about the package or app.

## Summary

```
FIELD       url
PATH        info.url
PARENT      info
TYPE        String
DEFAULT     ""
```

## Example

```toml
[info]
  url = "vorteil.io"
```

## CLI Flag

```
--info.url="vorteil.io"
```