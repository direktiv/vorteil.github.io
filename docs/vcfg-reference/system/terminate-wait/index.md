---
title: terminate-wait
nav_order: 9
layout: default
parent: system
grand_parent: VCFG Reference
---

# terminate-wait

The `terminate-wait` field determines how long the system should wait (milliseconds) for program processes to finish on shutdown before attempting to kill all system processes, and shutting down the system.

## Summary

```
FIELD       terminate-wait
PATH        system.terminate-wait
PARENT      system
TYPE        Integer
DEFAULT     3000
```

## Example

```toml
[system]
  terminate-wait = 3000
```

## CLI Flag

```
--system.terminate-wait=3000
```
