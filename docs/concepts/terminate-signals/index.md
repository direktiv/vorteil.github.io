---
title: Terminate Signals
nav_order: 10
has_children: false
layout: default
parent: Concepts
---

# Terminate Signals
Certain programs have different behaviours depending on the signal they receive when terminating the process. Terminate signals allows you to configure what system signal to send to a program on shutdown.

## Program Terminate Signals
Terminate signals are configured per program and can be configured by setting the `program[N].terminate` VCFG property.

### Supported Signals:
- SIGTERM (default)
- SIGINT
- SIGKILL
- SIGPWR
- SIGQUIT
- SIGSTOP

If a VCFG has no terminate signal set on a program, `SIGTERM` will be used by default.

*Note: Configured terminate signals are only sent to programs configured in the VCFG. All remaining processes are killed on system shutdown with `SIGINT` & `SIGTERM`.*

## Terminate Signal Timeout

On shutdown, configured system signals are sent to terminate a program's process. Once all of the program processes are finished the system will shutdown. This ensures that programs can clean upon termination. 

A timeout can be set to kill program processes if they are taking too long. This timeout is system-wide and can be set with `system.terminate-wait` VCFG property. 

The timeout is the max amount of milliseconds to wait for program processes to finish before shutting down the system.


## Example
VCFG

```toml
[[program]]
  binary = "/bin/postgres"
  terminate = "SIGQUIT"

[system]
  terminate-wait = 3000
```

CLI

```sh
$ vorteil run ./postgres --system.terminate-wait=3000 --program[0].terminate=SIGQUIT
```

The above examples will send the Postgres program a SIGQUIT signal on shutdown, which will cause Postgres to shutdown in [Immediate Shutdown mode](https://www.postgresql.org/docs/9.5/server-shutdown.html).
Additionally, if the shutdown is not done within 3000ms, vorteil will force shutdown all remaining process and system.
