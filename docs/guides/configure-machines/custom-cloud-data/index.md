---
title: Custom cloud data
nav_order: 3
layout: default
has_children: false
parent: Configuring a machine
grand_parent: Guides
---

# Adding custom cloud data

Most public cloud providers provide a means by which their customers can attach custom and unique metadata to each virtual machine they create. The purpose of this capability is generally left up to the user. With Vorteil, we've added a step to the start-up process that will automatically request this metadata when booting up in one of these cloud environments. If the contents of the metadata is structured a certain way, the Vorteil VM will use it to define environment variables before starting the programs.

In some situations, this functionality can be very useful with Vorteil. Because Vorteil VMs have no SSH and no shell, it's not usually possible to connect to them and manually adjust their configuration after they've been provisioned.

Consider a simple database cluster in Vorteil: what is the best way to launch three instances and connect them to one-another? Many databases have a config file that needs a list of IP addresses for their peers. By combining custom instance metadata and bootstrap instructions it is possible to make three separate instances from an identical image aware of each others' IP addresses.

## Variables 

Each cloud provider has it's own way of allowing custom metadata to be populated into machines, the methods for AWS, GCP, and Azure are detailed below. These attributes can be populated into the machine through the use of the USERDATA environment variable. The contents of this variable are populated depending on the cloud the machine is running in, as per below:

- Azure: Text in the "Custom data" (Advanced Tab)
- Google Cloud: Text stored in ["Metadata"](https://cloud.google.com/compute/docs/storing-retrieving-metadata) key "vorteil"
- Amazon: Text in ["User data"](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html) (as text)

This information can then be used with [Bootstrapping](../concepts/bootstrapping/) options to populate any necessary configuration files.

For more information about configuration options at runtime, please see [Vorteil Runtime Environment](../concepts/runtime-environment/).

## Cloud specific configurations

### Amazon EC2
Amazon's EC2 allows customers to provide a single payload of data as custom instance metadata. They call this "Instance User Data". Vorteil will automatically retrieve this payload if it exists, and use it if it is a valid variables JSON object.

Use the following link to Amazon's documentation to learn how to set instance user data:

[https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html#instancedata-add-user-data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html#instancedata-add-user-data)

### Google Compute Engine
Google's Compute Engine organizes custom instance metadata into key-value pairs. To take advantage of Vorteil's automatic retrieval of custom instance metadata, store the variables JSON under the "vorteil" key.

Use the following link to Google's documentation to learn how to set custom instance metadata:

[https://cloud.google.com/compute/docs/storing-retrieving-metadata#custom](https://cloud.google.com/compute/docs/storing-retrieving-metadata#custom)


### Azure
Azure allows customers to provide a single payload of data as custom instance metadata. Vorteil will automatically retrieve this payload if it exists, and use it if it is a valid variables JSON object.

Use the following link to Azure's documentation to learn how to set custom data:

[https://docs.microsoft.com/en-us/azure/virtual-machines/windows/instance-metadata-service#custom-data](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/instance-metadata-service#custom-data)
