---
title: Configuring FluentBit sources
nav_order: 2
has_children: false
layout: default
parent: Monitoring
grand_parent: Guides
---

# Configuring FluentBit sources

Vorteil has a [FluentBit](https://fluentbit.io/) agent embedded into every Vorteil machine created. This allows users to configure additional logging targets based on the technology being used for their platform.

## What output plugins are supported

Currently, FluentBit 1.6.3 is supported. All of the output plugins are embedded into the Vorteil machine:

[FluentBit Outut Plugins](https://docs.fluentbit.io/manual/v/1.6/pipeline/outputs)

## Example: logging to InfluxDB

Let's say you want to use the [InfluxDB output plugin](https://docs.fluentbit.io/manual/pipeline/outputs/influxdb):

*The influxdb output plugin, allows to flush your records into a InfluxDB time series database. The following instructions assumes that you have a fully operational InfluxDB service running in your system.*

Configuration parameters are:
- Host:  IP address or hostname of the target InfluxDB API service (127.0.0.1)
- Port: TCP port of the target InfluxDB API service (8086)
- Database: InfluxDB database name where records will be inserted (fluentbit)
- Sequence_Tag: The name of the tag whose value is incremented for the consecutive simultaneous events (_seq)

So to translate those configuration settings into the Vorteil config it would look something like this:
```toml
[[logging]]
  config = ["Name= influxdb", "Host=127.0.0.1", "Port=8086", "Database=fluentbit","Sequence_Tag=_seq"]
  type = "programs"
```

The *config* string can use environment variables and the value will be replaced during runtime. Only the global environment variables (e.g. IP0, EXT_IP0) and environment variables provided via [cloud user data](../../concepts/runtime-environment/) can be used. A configuration could look like:

```toml
[[logging]]
  config = ["Name= influxdb", "Host=$IP0", "Port=$CLOUDVAR", "Database=fluentbit","Sequence_Tag=_seq"]
  type = "programs"
```



## Example: logging to Splunk

Let's say you want to use the [Splunk output plugin](https://docs.fluentbit.io/manual/pipeline/outputs/splunk):

*Splunk output plugin allows to ingest your records into a Splunk Enterprise service through the HTTP Event Collector (HEC) interface.*

Configuration parameters are:
- Host: IP address or hostname of the target Splunk service (splunk-host.vorteil.io)
- Port: TCP port of the target Splunk service (8088)
- Splunk_Token: Specify the Authentication Token for the HTTP Event Collector interface (397438947s9dsjkdhjdns893uyo3)

So to translate those configuration settings into the Vorteil config it would look something like this:
```toml
[[logging]]
  config = ["Name="Splunk","Host=splunk-host.vorteil.io","Port=8088","Splunk_Token=397438947s9dsjkdhjdns893uyo3"]
  type="programs"
```
