---
title: Configuring a provisioner
nav_order: 2
has_children: true
layout: default
parent: Guides
has_toc: false
---

# Configure a provisioner

Vorteil provisioners are used to provision apps (as micro-VMs) to public or private cloud platforms (or Infrastructure-as-a-Service providers). The types of provisioners supported are:
* [Amazon Web Services](https://aws.amazon.com/)
* [Azure](https://azure.microsoft.com/)
* [Google Cloud Platform](https://cloud.google.com)
* [Nutanix](https://www.nutanix.com)
* [VMware vCenter/ESXi](https://www.vmware.com/)

The provisioners for each of the cloud platforms automtically select the correct hypervisor and disk format for the micro-VMs. The micro-VMs are provisioned as images (AMI, Image or Templates depending on the cloud platform).

For higher-level orchestration of the deployment of the virtual machines, orchstration solutions such as:
* [Ansible](www.ansible.com)
* [Pliant.io](www.pliant.io)
* [Terraform](www.terraform.io), or
* [VMware vRealize Automation (vRA)](https://www.vmware.com/au/products/vrealize-automation.html) should be used.
