---
title: Privileges
nav_order: 5
has_children: false
layout: default
parent: Concepts
---

# Privileges

Vorteil supports running apps with as root, non-root, and superuser privileges. Some applications have been programmed to check that the user whom owns the process is/isn't 'root' (or any other user), and to exit if this check does not pass.

For example, look at what happens when the `postgres` package is run with root privileges:

```
$ vorteil run https://apps.vorteil.io/file/vorteil/postgres --program[0].privilege root
...
[0.520000] starting as root, uid 0
"root" execution of the PostgreSQL server is not permitted.
The server must be started under an unprivileged user ID to prevent
possible system security compromise.  See the documentation for
more information on how to properly start the server.
...
```

We can overcome this by changing the value of the `--program.0.privilege` field to `user` or `superuser`:

```
$ vorteil run https://apps.vorteil.io/file/vorteil/postgres --program[0].privilege user
...
[0.490000] starting as vorteil, uid 1000
2020-07-28 10:07:49.515 AEST [920] LOG:  listening on IPv4 address "0.0.0.0", port 5432
2020-07-28 10:07:49.517 AEST [920] LOG:  listening on IPv6 address "::", port 5432
2020-07-28 10:07:49.520 AEST [920] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
2020-07-28 10:07:49.543 AEST [920] LOG:  database system is ready to accept connections
...
```

Notice that the program starts as `vorteil` instead of `root`. In this example, vorteil is a regular user without root or superuser privileges. If your app requires elevated privileges and does not support being run as the root user, set the value of `--program.0.privilege` to `superuser`. This will run as the non-root user, with the following ambient capabilities:

    CAP_CHOWN
    CAP_DAC_OVERRIDE
    CAP_DAC_READ_SEARCH
    CAP_FOWNER
    CAP_IPC_OWNER
    CAP_NET_ADMIN
    CAP_MKNOD
    CAP_NET_BIND_SERVICE
    CAP_NET_RAW
    CAP_SYS_ADMIN

If an app requires a specific name for the non-root user, this can be configured by setting the `--system.user` field. By default, this value is `vorteil`.

```
$ vorteil run https://apps.vorteil.io/file/vorteil/postgres --ignore-kernel --program[0].privilege user --system.user postgres
...
[0.510000] starting as postgres, uid 1000
...
```