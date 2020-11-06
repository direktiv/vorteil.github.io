---
title: VMware ESXi - Getting Details
nav_order: 4
has_children: false
layout: default
parent: Configuring a provisioner
grand_parent: Guides
---

**VMware ESXi/vCenter is only available in the enterprise edition of the Vorteil Tools**

In some cases (development, test or standalone environments) a user would like to create a ESXi/vCenter provisioner. For cases like these, the VMware API requires the datacentre and cluster to be configured (similar to that of a vCenter). The datapoints for these attributes are available via the VMware Web Client Management Object Browser (MOB). To connect to the MOB of an ESXi server, the following URL is used:

- https://{esxi-server-ip-or-hostname}//mob

Authentication is via the root username and password (or whatever authentication method was enabled for ESXi Web Client access). Below is a screenshot of the landing page for the MOB:

<img style="box-shadow:none;margin-top:25px !important;margin-bottom:25px !important" src="https://storage.googleapis.com/vorteil-dl/DocImagesVids/1stvmware.png" />

*Please note: from ESXi 6.0 onwards, MOB access is disabled by default. To enable the MOB access, set the ESXi Advanced Setting called Config.HostAgent.plugins.solo.enableMob to **“true”** (screenshot below):*

<img style="box-shadow:none;margin-top:25px !important;margin-bottom:25px !important" src="https://storage.googleapis.com/vorteil-dl/DocImagesVids/2ndvmware.png" />

The configuration items for each of the components are described below:

- Datacenter can be found at the following MOB path: content:ServiceContent -> rootFolder: ManagedObjectReference:Folder -> childEntity:ManagedObjectReference:ManagedEntity[]->name:string = ”ha-datacenter” (screenshot below):

<img style="box-shadow:none;margin-top:25px !important;margin-bottom:25px !important" src="https://storage.googleapis.com/vorteil-dl/DocImagesVids/3rdvmware.png" />

- Datastore can be found at the following MOB path: content:ServiceContent -> rootFolder: ManagedObjectReference:Folder -> childEntity:ManagedObjectReference:ManagedEntity[]->datastore:ManagedObjectReference:Datastore[]->name:string = “datastore1” (screenshot below):

<img style="box-shadow:none;margin-top:25px !important;margin-bottom:25px !important" src="https://storage.googleapis.com/vorteil-dl/DocImagesVids/4thvmware.png" />

- Host Cluster can be found at the following MOB path: content:ServiceContent -> rootFolder: ManagedObjectReference:Folder -> childEntity:ManagedObjectReference:ManagedEntity[] -> hostFolder: ManagedObjectReference:Folder -> childEntity:ManagedObjectReference:ManagedEntity[] -> name:string = “ewr1-c1.small.x86-01”

<img style="box-shadow:none;margin-top:25px !important;margin-bottom:25px !important" src="https://storage.googleapis.com/vorteil-dl/DocImagesVids/5thvmware.png" />