---
title: summary
nav_order: 5
layout: default
parent: info
grand_parent: VCFG Reference
---

# summary

The `summary` field provides a very brief blurb or summary of the package or app. It should not use any special characters or formatting, and it should be limited to a maximum of 280 characters.

## Summary

```
FIELD       summary
PATH        info.summary
PARENT      info
TYPE        String
DEFAULT     ""
```

## Example

```toml
[info]
  summary = "My blurb."
```

## CLI Flag

```
--info.summary="My blurb."
```