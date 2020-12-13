---
title: .NET Core
nav_order: 1
has_children: false
layout: default
parent: Running your own application
grand_parent: Getting Started
---

# Starting a .NET project

In this quickstart guide, we’ll show you how to set up and configure a simple .NET web server on Vorteil.

## Before you start

Please make sure you have Vorteil and at least one [supported hypervisor](/docs/guides/configure-virtualizer/) installed.

## .NET demo application

For this article, we will be using a simple web server that is generated from the ‘dotnet’ commands in the terminal. Before we delve further please make sure you have .NET installed on your system. To install .NET follow this [guide](https://dotnet.microsoft.com/download/linux-package-manager/sdk-current). If you wish to use your own .NET web application feel free to as the steps will be very similar.

## Create a web application

To begin we need to tell .NET to create a new web application to use with the following command.

```sh
$ dotnet new web -o /tmp/demo
```

After that has completed go into that directory, where we will call ‘dotnet run’ to start the web application. You should be able to visit the page at this address if everything was successful and ‘Hello World!’ should appear in browser.

```sh
$ cd /tmp/demo
$ dotnet run
```

Now that we have built the web application and ran it we need to publish the applications components to run by itself into another directory so we can tell Vorteil how to run it.

## Publish the webapp

To publish the web app first we need to call the following command to tell .NET to use these contents and export into a standalone application.

```sh
$ dotnet publish --self-contained --runtime=linux-x64 --output /tmp/myapp
```

When this is finished the contents of the application should be inside ‘/tmp/myapp’.

## Create a Vorteil project

We now need to create the vorteil project and tell Vorteil how we run the .NET application. First with the following command we will build the ‘.vorteilproject’ and ‘.default.vcfg’ file.

The command tells Vorteil which binary to point at and which network address that we should bind to. .NET also requires environment variables to be set which can be done in the same command.

```sh
$ vorteil projects new --program.0.binary /demo \
--network.0.http 5000 \
--program.0.env ASPNETCORE_URLS=http://0.0.0.0:5000, DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 \
/tmp/myapp 
```

Now we need to import any shared objects to be able to run the application successfully (Note: you will be unable to complete this step on Windows or Mac, but could spawn a Linux machine and gather the required shared objects from it). The following command will check each binary and import the shared objects that they require if they are on your system.

```sh
$ vorteil import-shared-objects /tmp/myapp
```

After creating the new project and importing shared objects make sure you are in the project directory (‘/tmp/myapp’). Typing ‘vorteil run’ should now create a webserver accessible at `localhost:5000`. If port 5000 is already in use, a different port will be chosen at-random (the CLI will inform the user if this occurs).

```sh
$ cd /tmp/myapp
$ vorteil run
```
