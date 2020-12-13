---
title: Go
nav_order: 2
has_children: false
layout: default
parent: Running your own application
grand_parent: Getting Started
---

# Starting a Go project

In this quickstart guide, we’ll show you how to set up and configure a simple Golang web server on Vorteil.

## Before you start

Please make sure you have Vorteil and at least one [supported hypervisor](/docs/guides/configure-virtualizer/) installed.

## Golang Web Server

For this article, we will be using a simple web server that says "Hello", followed by the child URL path. Before we start, please make sure you have [installed Golang](https://golang.org/) on your local machine and are capable of building go ELF binaries. You may also use your own binary.

The code below will be used in this article. It is located in an empty directory and is named `main.go`.

```go
package main

import (
	"fmt"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"
)

var PORT = 7474

func main() {
	fmt.Printf("Server is Starting on PORT = %v\n", PORT)
	http.HandleFunc("/", HelloServer)

	// Graceful Stop Logic
	var gracefulStop = make(chan os.Signal)
	signal.Notify(gracefulStop, syscall.SIGTERM)
	signal.Notify(gracefulStop, syscall.SIGINT)

	go func() {
		sig := <-gracefulStop
		fmt.Printf("caught sig: %+v", sig)
		fmt.Println("Wait for 2 second to shutdown server")
		time.Sleep(2 * time.Second)
		os.Exit(0)
	}()

	err := http.ListenAndServe(fmt.Sprintf(":%v", PORT), nil)
	if err != nil {
		panic(err)
	}
}

// Server Handler
func HelloServer(w http.ResponseWriter, r *http.Request) {
	_, err := fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
	if err != nil {
		fmt.Println(err)
	}
}
```

Now that we have the code, we must compile it.

## Compiling Go code

To compile your code into a binary use Go’s ‘build’ command.

```sh
$ go build -o server
```

The Vorteil kernel only supports 64-bit x86 Linux programs, so if you’re not running a 64-bit x86 Linux system you’ll have to cross-compile your code. It’s usually pretty painless cross-compiling in Go: you just need to set some environment variables before calling ‘go build’.

On Mac:

```sh
$ GOOS=linux GOARCH=amd64 go build -o server
```

The same command works on Linux, but is only necessary if you’re running a version of Linux that isn’t running 64-bit on x86 hardware.

And on Windows:

```sh
$ set GOOS=linux
$ set GOARCH=amd64
$ go build -o server
```

If you needed to cross-compile the program, you won’t be able to execute it any more. That’s normal: the binary you built is incompatible with your development environment.

## Creating a Vorteil Project

Now that we have our web server ELF Binary we need to create a Vorteil Project. Open your terminal where your server ELF binary will exist and run the following two commands.

```sh
$ vorteil projects new server
$ ls -a
.  ..  .default.vcfg  server  .vorteilproject
```

The ‘ls’ tool on Mac and Linux lists the contents of your working directory; if you’re working on Windows you can use ‘dir’ instead. Another difference on Windows is that the binary will actually be called “server.exe”.

As you can see in the first command we create a new Vorteil project. The second command was used to show the project files the Vorteil CLI created. Now that we have successfully created a Vorteil project we will configure the projects Vorteil Configuration (“.default.vcfg”).

## Configuration

The Vorteil configuration file is based on TOML so it’s very simple to edit. First, open the “.default.vcfg” in your text editor of choice.

Currently, the VCFG should look like this:

```toml
[[program]]
  binary="server"
```

The VCFG is the Vorteil configuration file. There are many fields that may be set, but we will only be looking at three in this article. For a more in-depth article of VCFG please read the [VCFG Reference Guide](/docs/vcfg-reference/).

The first field we will look at is the `binary` field. By default, the binary field is empty, but because we provided the `--programs.0.binary` flag when creating the project, the Vorteil CLI set the `binary` field of the `0`th program to `"server"`.

The second field we must set is underneath a map, named “network”, and contains a list of ports that our web server will serve on. Because our server is set to use port 7474 we will set “http” to equal [“7474”].

Also underneath the “network” map we need to set “ip” to equal “dhcp".

Now that our VCFG has been configured it should look like this:

```toml
[[program]]
  binary = "server"

[[network]]
  ip = "dhcp"
  http = ["7474"]
```

## Shared Objects

The final step before we are able to run our Vorteil instance is to import any shared object dependencies. ELF binaries are dependent on shared objects to run, and Vorteil does not include these by default. Each ELF binary needs different libraries to run, and placing only the ones required is part of optimizing a Vorteil project. The Vorteil CLI has a feature, which we will use, that will scan the files contained within a project and gather any shared objects found on the host system:

```sh
$ vorteil projects import-shared-objects
```

Alternatively, Golang provides ways of compiling code in to statically-linked binaries, eliminating the need for any shared objects. To statically compile the provided Go code, set the `CGO_ENABLED` environment variable to `0` when running `go build`.

## Run

Now that we’re all set up, running is super easy. Simply run the following the command when inside the projects directory.

```sh
$ vorteil run
Writing image done [==============================================================================] 100.00% 0s
[INFO 0/0] 0:  vorteil kernel 0.3.6-1a114a7
[INFO 0/6] 03:47:21:595021:  ip: 10.0.2.15
[INFO 0/6] 03:47:21:595793:  mask: 255.255.255.0
[INFO 0/6] 03:47:21:623047:  broadcast: 10.0.2.255
[INFO 0/6] 03:47:21:635762:  gateway: 10.0.2.2
[INFO 0/2] 03:47:21:636418:  dns: 10.0.2.3
Server is Starting
```

Now since we are running on a local non-bridged hypervisor our IP will be [http://localhost:7474/](http://localhost:7474/).

Visiting this URL in your browser should serve you a blank page with text that says “Hello, !”. To see the full functionality of our little web server we can simply change to URL to [http://localhost:7474/Vorteil](http://localhost:7474/Vorteil), and now we will be displayed with text that says “Hello, Vorteil!”.

That’s it. We have successfully written a Go web server, created a Vorteil project, configured the project to work with our web server, and tested our web server running on Vorteil.
