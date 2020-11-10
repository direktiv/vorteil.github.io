---
title: Repositories
nav_order: 8
has_children: false
layout: default
parent: Concepts
---

# Repositories
Vorteil supports pushing and pulling from a remote vRepo (Vorteil Repository). vRepo's are repositories that contain vorteil projects organised into buckets and organisations.

## vRepo Access Keys
Some vRepo's are protected and will require a key to interact with. 

You can register a key using the Vorteil tools. You will need to have a vRepo access key; This can be generated in the vRepo frontend by any user that has permissions to the targeted resource. Once you have a valid access key you can register it with the Vorteil tools. Below is an example of registering a token as 'key1'.
```sh
vorteil repositories keys create key1 ACCESS_TOKEN
```

When creating a key you can also use the `--default` flag to configure Vorteil to use the created key by default when executing operations that require it. If you didn't use the `--default` flag on key creation, you can set any existing key as default with the `default` command:
```sh
vorteil repositories keys default key1 
```
Additionally, if you omit the key argument to the `default` command it will print the currently set default key.
```sh
$ vorteil repositories keys default
key1
```

Any additional existing keys can be viewed with the `list` command, as seen below:
```sh
$ ./vorteil repositories keys list
key1 [default]
key2
```

## vRepo: Pushing

Before starting please make sure you have configured an Access Key with permissions to the target resource on your Vorteil Tools. 

Vorteil can push any Vorteil buildable path to vRepo. Before pushing to vRepo you must set up an organisation and bucket. 

Pushing to vRepo is as easy as running a command with the following structure (values in commands are place holders):
```sh
$ vorteil repositories push https://vrepo.vorteil.io/metadata vorteil.org/vbucket/new-app /tmp/helloworld.vorteil --key key1
Preparing Package  ⠋                                                                                
Uploading Package done [===============================================================] 4.0 MiB / 4.0 MiB
```

To push a new version of an app you can simply run the same command:
```sh
$ vorteil repositories push https://vrepo.vorteil.io/metadata vorteil.org/vbucket/new-app /tmp/helloworld-version2.vorteil --key key1
```

## vRepo: Pulling

Before starting please make sure you have configured an Access Key with permissions to the target resource on your Vorteil Tools. 
Note: No Access Key is needed for interacting with the public marketplace at http://apps.vorteil.io/.

Pulling refers to downloading or running a Vorteil Project from a remote resource such as a vRepo Repository or our public marketplace. Below are two examples of running a remote Vorteil Project on your local machine:

#### **Running helloworld from the marketplace**
```sh
$ vorteil run https://apps.vorteil.io/file/vorteil/helloworld
```

#### **Running pushed app from private vRepo**
```sh
$ vorteil run https://vrepo.vorteil.io/metadata/file/vorteil.org/vbucket/new-app --key key1
```

If you want to export a remote Vorteil project to your local system you can unpack it directly to your system. To unpack a remote project simply run a command similar to those below:

#### **Unpacking helloworld from marketplace to /tmp/helloworld**
```sh
$ vorteil unpack https://apps.vorteil.io/file/vorteil/helloworld /tmp/helloworld
```

#### **Unpacking pushed app from private vRepo to /tmp/new-app**
```sh
$ vorteil unpack https://vrepo.vorteil.io/metadata/file/vorteil.org/vbucket/new-app /tmp/new-app --key key1
```

All Vorteil Commands that accept a buildable path as an argument can also accept a remote Vorteil Project as input. So long as the access key has been configured if needed.