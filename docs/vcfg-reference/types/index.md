---
title: types
nav_order: 9
layout: default
parent: VCFG Reference
---

# Types

Some custom types exist that can be used for some fields within a VCFG.

## Size

Size fields allow users to define large quantities of bytes in the VCFG.

### Parsing

A Size field can be parsed as either a TOML Integer or String. If an Integer, or a String that can be parsed as an integer, the supplied number will be taken to be a number in bytes.

Gives as a String, the field may optionally contain letters representing common units of size. A best effort approach to interpreting the meaning will be applied. The interpreting logic understands the following units: "B", "KiB", "MiB", and "GiB". Combinations of units are not acceptable.

The interpreting logic it not strict: mixed case is tolerated, as is the ommision of the "i" (in "KiB", for example). Note that although there is a scientific difference between "MiB" and "MB", there is no difference in the VCFG and all units will be powers of two.

### Examples

| value   | size       |
|:-------:|:----------:|
| 1024    | 1024 bytes |
| "1024"  | 1024 bytes |
| "1 KiB" | 1024 bytes |
| "1kb"   | 1024 bytes |

### Used By

- [vm.ram](../vm/ram)
- [vm.disk-size](../vm/disk-size)

## Timestamp

Timestamp fields allow users to define a specific date and time in the VCFG.
Parsing

A Timestamp field can be parsed as either a TOML Integer or String. If an Integer the value will be taken as an epoch (Unix) time. As a String the field is quite flexible, recognizing many standardized timestamp formats as well as many common shorthand styles.

### Supported standards:

- ANSIC
- RFC822
- RFC850
- RFC1123
- RFC3339

### Examples

| value | date |
|:-----:|:----:|
|1136239445|Mon Jan 2 15:04:05 MST 2006|
|"1136239445"|	Mon Jan 2 15:04:05 MST 2006|
|"Mon Jan _2 15:04:05 2006"|	Mon Jan 2 15:04:05 MST 2006|
|"Mon Jan _2 15:04:05 MST 2006"|	Mon Jan 2 15:04:05 MST 2006|
|"Mon Jan 02 15:04:05 -0700 2006"|	Mon Jan 2 15:04:05 MST 2006|
|"02 Jan 06 15:04 MST"|	Mon Jan 2 15:04:05 MST 2006|
|"02 Jan 06 15:04 -0700"|	Mon Jan 2 15:04:05 MST 2006|
|"Monday, 02-Jan-06 15:04:05 MST"|	Mon Jan 2 15:04:05 MST 2006|
|"Mon, 02 Jan 2006 15:04:05 MST"|	Mon Jan 2 15:04:05 MST 2006|
|"Mon, 02 Jan 2006 15:04:05 -0700"|	Mon Jan 2 15:04:05 MST 2006|
|"2006-01-02T15:04:05Z07:00"|	Mon Jan 2 15:04:05 MST 2006|
|"2006-01-02T15:04:05.999999999Z07:00"|	Mon Jan 2 15:04:05 MST 2006|
|"2006 01 02"|	Mon Jan 2 00:00:00 UTC 2006|
|"2006-01-02"|	Mon Jan 2 00:00:00 UTC 2006|
|"2006/01/02"|	Mon Jan 2 00:00:00 UTC 2006|
|"2006.01.02"|	Mon Jan 2 00:00:00 UTC 2006|
|"02 01 2006"|	Mon Jan 2 00:00:00 UTC 2006|
|"02-01-2006"|	Mon Jan 2 00:00:00 UTC 2006|
|"02/01/2006"|	Mon Jan 2 00:00:00 UTC 2006|
|"02.01.2006"|	Mon Jan 2 00:00:00 UTC 2006|
|"02 01 06"|	Mon Jan 2 00:00:00 UTC 2006|
|"02-01-06"|	Mon Jan 2 00:00:00 UTC 2006|
|"02/01/06"|	Mon Jan 2 00:00:00 UTC 2006|
|"02.01.06"|	Mon Jan 2 00:00:00 UTC 2006|
