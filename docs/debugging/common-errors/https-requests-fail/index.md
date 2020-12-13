---
title: HTTPS requests fail for applications
nav_order: 5
layout: default
has_children: false
parent: Common errors
grand_parent: Debugging
---

# HTTPS requests fail for applications

## Symptom

The application is unable to perform requests using HTTPS. The exact error message is dependent on the application; for example, a golang application would display:

```sh
x509: certificate signed by unknown authority
```

## Cause

The application does not include a CA Certificate file within the `/etc/ssl/certs` directory.

## Solution

Place a CA Certificate file within the `/etc/ssl/certs directory` of your Vorteil application. Example:

```sh
$ cp /etc/ssl/certs/ca-certificate.sh $PROJECT_DIR/etc/ssl/certs/
```

*Note: the name of the CA Certificate file may vary depending on the host operating system*
