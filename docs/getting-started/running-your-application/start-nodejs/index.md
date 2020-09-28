---
title: Node.js
nav_order: 4
has_children: false
layout: default
parent: Running your own application
grand_parent: Getting Started
---

# Starting a Node.js project

In this quickstart guide we’ll show you how to start a project based on Node.js.

## Before you start

Please make sure you have Vorteil and at least one [supported hypervisor](/docs/guides/configure-virtualizer/) installed.

## Node.js public repository application

This guide isn’t meant to be an introduction to Node.js, but there are a few things you’ll need to do to follow along. We’ll take you through all the steps you need to run Node’s Hello World on Vorteil.

Let’s start by fetching our standalone application for Nodejs and extracting it into a folder.

```
$ vorteil unpack https://apps.vorteil.io/file/vorteil/nodejs ./nodejs/
$ cd nodejs
```

Once inside the newly-created project directory, executing the following command will run the app:

```
$ vorteil run
Provisioning VM [===================================================] 100.00% 3s
Warning: VM has network cards but no defined ports (hypervisor=virtualbox, vm=nodejs-jazp)
[INFO 0/0] 0:  vorteil kernel 0.3.7-9c56de7
[INFO 0/6] 04:27:39:654082:  ip: 10.0.2.15
[INFO 0/6] 04:27:39:659715:  mask: 255.255.255.0
[INFO 0/6] 04:27:39:660410:  broadcast: 10.0.2.255
[INFO 0/6] 04:27:39:661330:  gateway: 10.0.2.2
[INFO 0/2] 04:27:39:661926:  dns: 10.0.2.3
v9.8.0
[INFO 0/7] 04:27:39:770576:  application stopped with no errors
```

_Exit the process and terminate the virtual machine by pressing Ctrl-C._

## Editing the application to make a Hello World server

Create a file named `app.js`, with the following contents:

```js
var http = require("http");

http.createServer(function (request, response) {

   // Send the HTTP header
   // HTTP Status: 200 : OK
   // Content Type: text/plain
   response.writeHead(200, {'Content-Type': 'text/plain'});

   // Send the response body as "Hello World"
   response.end('Hello World this is nodejs\n');
}).listen(8080);

// Console will print the message
console.log('Server running at http://127.0.0.1:8080/');
```

To edit the application and change how it is run we first need to change the VCFG details. First we need to change the args of the VCFG from ‘-v’ to the ‘app.js’ file we created. Then we need to add the network section in the VCFG to tell Vorteil to open a port for the server to be hosted on.

```toml
[[program]]
  binary = "/node"
  args = "app.js"

[env]
  EXT_IP0 = "$EXT_IP0"

[[network]]
  ip = "dhcp"
  http = ["8080"]

[system]
  dns = ["8.8.8.8", "8.8.4.4"]
  max-fds = 1024
  output-mode = "standard"

[vm]
  cpus = 1
  ram = "256 MiB"
  inodes = 6000
  disk-size = "132 MiB"
```

After making these changes we can try running the application using Vorteil again.

```
$ vorteil run
Provisioning VM [===================================================] 100.00% 2s
network settings
 • http:8080 → localhost:42885
[INFO 0/0] 0:  vorteil kernel 0.3.7-9c56de7
[INFO 0/6] 04:35:52:655815:  ip: 10.0.2.15
[INFO 0/6] 04:35:52:675178:  mask: 255.255.255.0
[INFO 0/6] 04:35:52:679322:  broadcast: 10.0.2.255
[INFO 0/6] 04:35:52:683528:  gateway: 10.0.2.2
[INFO 0/2] 04:35:52:684142:  dns: 10.0.2.3
Server running at http://127.0.0.1:8080/
```

In the example above, Vorteil attempted to bind the virtual machine to port 8080, but the port was already in use by another process. The tools then randomly selected a port that is not in-use, and configured the virtual machine to use that instead. Visit the app in your preferred web browser at [http://localhost:8080](http://localhost:8080) (changing the port if necessary) to see the 'Hello World' page.

This should provide you with the stepping stones to further develop more complex applications to run on Vorteil. As it gives you the capability of replacing ‘app.js’ with whatever file you wish to run with Node.js.