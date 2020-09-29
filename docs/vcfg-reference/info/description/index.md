---
title: description
nav_order: 3
layout: default
parent: info
grand_parent: VCFG Reference
---

# description

The `description` field can contain any amount of information you want. This may be detailed descriptions about its purpose, usage information, examples, marketing fluff, or all of the above. Its length is not limited like the summary field is, and the use of formatting is encouraged. Some of our tools will attempt to render the description as Markdown, which can be exploited to make long descriptions more readable.

For this field in particular it is worth noting that TOML supports large, multiline strings with preserved formatting and whitespace by using triple quotes instead of normal quotes, as per the example above.

## Summary

```
FIELD       description
PATH        info.description
PARENT      info
TYPE        String
DEFAULT     ""
```

## Example

```toml
[info]
  description = """My description."""
```

# CLI Flag

```
--info.description="My description."
```