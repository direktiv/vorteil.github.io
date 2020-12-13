---
title: Configuring NFS
nav_order: 5
layout: default
has_children: false
parent: Configuring a machine
grand_parent: Guides
---

# Configuring NFS for file mounts / shares

Vorteil is capable of mounting NFS shares at start-up for storing persistent data (or accessing configuration files /shares for applications)

## Configuration

Assume that the mount point within the Vorteil machine is `/nfs`. The `/nfs` directory does not currently exist within the Vorteil virtual machine. This folder can be easily created by executing `mkdir /nfs` from the project's root directory.

Additionally, the following configuraiton must be added to the default.vcfg file of the project. Change the IP address used for the server field to that of your NFS server. The options field supplies the mount options.

```toml
[[nfs]]
  mount = "/nfs"
  server = "192.168.1.128:/mnt/nfsshare"
  options = "vers=4"
```

Restarting the instance should reveal an additional line in the output of the virtual machine which confirms the NFS mount settings.

```sh
[    0.160000]  nfs :/mnt/sharedfolder at /myfiles with vers=4,addr=192.168.1.128
```

If you wish to use an NFS3 mount, the nolock option must be supplied. For example:

```toml
[[nfs]]
  mount = "/myfiles"
  server = "192.168.1.128:/mnt/sharedfolder"
  options = "vers=3,nolock"
```

## Example: AWS EFS configuration

Using [AWS Elastic File Shares (EFS)](https://aws.amazon.com/efs/) to create an NFS file share:

Step 1: create the new file share from the AWS Console:

![NFS](/assets/guides/configure-machines/configuring-nfs/create-nfs.png)

Step 2: select the "Customize" option and select the options needed for the file share:

![ShareCustomize](/assets/guides/configure-machines/configuring-nfs/customize-nfs.png)

Step 3: all other options can remain default and create the file share

Step 4: copy the settings for the file share from the "Attach" options:

![Attach](/assets/guides/configure-machines/configuring-nfs/attach-nfs.png)

Step 5: configure the Vorteil machine with the DNS name for the share and the mount options:

```toml
[[nfs]]
  mount = "/nfs"
  server = "fs-a4e6449c.efs.ap-southeast-2.amazonaws.com:/"
  options = "nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport"
```
