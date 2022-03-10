---
layout: post
title:  "Installing AIL with lxc/lxd"
author: adulau
---


## Introduction

[lxc/lxd](https://linuxcontainers.org/) provides a framework for vendor neutral containers. This post explains how to install AIL framework in a container or already use the existing AIL container.

## Steps
The instance name will be `ail`.

- install lxd `apt install lxd` and `apt install lxc`
- initialize with `lxd init` (default configuration is ok)
- deploy and start a Ubuntu instance `lxc launch ubuntu:20.04 ail`

## Check if the instance is installed and running

~~~~
lxc list
+------+---------+-------------------+------------------------------+-----------+-----------+
| NAME |  STATE  |       IPV4        |             IPV6             |   TYPE    | SNAPSHOTS |
+------+---------+-------------------+------------------------------+-----------+-----------+
| ail  | RUNNING | 10.3.94.60 (eth0) | fd42:7ab::22 (eth0)          | CONTAINER | 0         |
+------+---------+-------------------+------------------------------+-----------+-----------+
~~~~

## Connect to the shell of the AIL container

`lxc exec ail -- /bin/bash`

### Add an ail user in the container

~~~~
root@ail:~# adduser ail
Adding user `ail' ...
Adding new group `ail' (1001) ...
Adding new user `ail' (1001) with group `ail' ...
Creating home directory `/home/ail' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for ail
Enter the new value, or press ENTER for the default
	Full Name []: AIL framework
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] 
~~~~

- Add the user to the sudoer group with `usermod -aG sudo ail`
- and then switch to the user `su - ail`

### Install AIL framework

#### Git clone AIL

`git clone https://github.com/ail-project/ail-framework.git`

#### Compile AIL

- `cd ail-framework`
- `./installing_deps.sh` 

Then take a cup of tea or coffee until the installation/compilation is over.

When it's over take notes of the generated password.

Such as (to be replaced by the one you saw in your terminal)

~~~~
new user created: admin@admin.test
password: aviWe)jgqcfLC4b*ZJtyMaBNOFRFyh
token: AKciyJGAJK8sWRXusWx3XqshTS6dz7KE8PGkC64CW
~~~~

#### Update the binding interface of the web interface

Replace the `host` with `0.0.0.0` to bind on all the interface of the container in `./config/core.cfg`.

~~~~
##### Flask #####
[Flask]
#Proxying requests to the app
baseUrl = /
#Host to bind to
host = 0.0.0.0 
#Flask server port
port = 7000
~~~~

#### Starting AIL

- `cd ./bin`
- `./LAUNCH.sh -l`

### Connecting to AIL web interface

Check the IP address of your container and connect to:

- `https://<IP of the container>:7000` with the login/password given at the installation

### Exporting the container (if you need it)

- `lxc snapshot ail fresh-install`
- `lxc publish  ail/fresh-install --alias ail-fresh-install`
- `lxc image export ail-fresh-install .`

# If you want to run the container without doing the installation

A ready made container is available. [
https://cra.circl.lu/lxc-containers/497cb236635bbe9dc345bc807e386b8f48f7f304fc25163cdb6df8e39fbc4146.tar.gz](
https://cra.circl.lu/lxc-containers/497cb236635bbe9dc345bc807e386b8f48f7f304fc25163cdb6df8e39fbc4146.tar.gz) and you can use `lxc import` to import the container.

```
lxc image import https://cra.circl.lu/lxc-containers/497cb236635bbe9dc345bc807e386b8f48f7f304fc25163cdb6df8e39fbc4146.tar.gz --alias fresh-ail
lxc launch fresh-ail myailcontainer
```

Now, dive in the container:
```
$ lxc exec myailcontainer -- /bin/bash
# su ail
$ cd ~/ail-framework/bin
$ ../LAUNCH -l
```
Get the container's IP address by entering `lxc list`
Then open a web browser on the host at
```
https://<container-ip-address>:7000
```

The default password for the web interface of AIL is G4FP7EabeXfuNPi
