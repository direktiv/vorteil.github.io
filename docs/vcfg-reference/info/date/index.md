---
title: date
nav_order: 2
layout: default
parent: info
grand_parent: VCFG Reference
---

# date

The `date` field can contain a timestamp identifying the release date. It is up to the package creator to decide whether the date should reflect the release date of the package itself or of the underlying program. The choice can be confusing when a creator is merely converting existing software for use with Vorteil.

## Summary

```
FIELD       date
PATH        info.date
PARENT      info
TYPE        Timestamp
DEFAULT     0
```

## Example

```toml
[info]
  date = "29/09/2020"
```

## CLI Flag

```
--info.date="29/09/2020"
```