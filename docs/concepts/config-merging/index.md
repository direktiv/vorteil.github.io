---
title: Configuration merging
nav_order: 2
has_children: false
layout: default
parent: Concepts
---

# Configuration merging

When multiple Vorteil Configuration (VCFG) files are provided to a Vorteil app they are intelligently merged to preserve all fields of the original VCFG that are not referenced by subsequent configurations.

This can be particularly useful when building a disk image from the Vorteil Command-Line Interface, as it grants the ability to run multiple uniquely-configured apps from the same source configuration.


## Multiple VCFG Files


VCFG 1:

```toml
[[program]]
  binary = "/bin/app"
  args   = ""

[[program]]
  binary = "/bin/app2"
  args   = ""
```

VCFG 2:

```toml
[[program]]

[[program]]
  args = "--start"
```

Result:

```toml
[[program]]
  binary = "/bin/app"
  args   = ""

[[program]]
  binary = "/bin/app2"
  args   = "--start"
```

## CLI Flags

VCFG fields can also be overwritten via the use of flags from the Vorteil Command-Line Interface (CLI):

VCFG:

```toml
[[program]]
  binary = "/bin/app"
  args   = ""

[[program]]
  binary = "/bin/app2"
  args   = ""
```

```sh
Flag:
--program.1.args = "--start"
```

Result:

```toml
[[program]]
  binary = "/bin/app"
  args   = ""

[[program]]
  binary = "/bin/app2"
  args   = "--start"
```
