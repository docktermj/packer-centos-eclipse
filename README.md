# packer-eclipse-cpp

This repository uses [Packer](https://www.packer.io/).
with a
CentOS 7.1 (1503) ISO image 
to create machine images for VMware and VirtualBox.

The virtual machine has Eclipse Neon for C/C++ Developers.

## Build dependencies

See [build dependencies](https://github.com/docktermj/KnowledgeBase/blob/master/build-dependencies/packer.md).

## Build

Use `make help` to see targets.

### Build all versions

```console
make
```

### Build specific version

VMware

```console
make vmware-iso
```

VirtualBox

```console
make virtualbox-iso
```

## Run on VMware Workstation

1. Choose VMX file
   1. VMware Workstation > File > Open...
      1. Navigate to `.../packer-centos-eclipse-cpp/output-vmware-iso-nnnnnnnnnn/`
      1. Choose `packer-centos-eclipse-cpp-nnnnnnnnnn.vmx`
1. Optional: Change networking
   1. Navigate to VMware Workstation > My Computer > packer-centos-eclipse-cpp-nnnnnnnnnn
   1. Right click on "packer-centos-eclipse-cpp-nnnnnnnnnn" and choose "Settings"
   1. Choose "Network Adapter" > "Network Connection" > :radio_button: Bridged: Connected directly to the physical network
   1. Click "Save"
1. Run image
   1. Choose VMware Workstation > My Computer > packer-centos-eclipse-cpp-nnnnnnnnnn
   1. Click "Start up this guest operating system"
1. Username: vagrant  Password: vagrant

## Run on Vagrant / VirtualBox

### Add to library

```console
vagrant box add --name="packer-centos-eclipse-cpp-virtualbox" ./packer-centos-eclipse-cpp-virtualbox-nnnnnnnnnn.box
```

### Run

An example of how to run in a new directory.

#### Specify directory

In this example the `/tmp/packer-centos-eclipse-cpp` directory is used.

```console
export PACKER_CENTOS_ECLIPSE_CPP=/tmp/packer-centos-eclipse-cpp
```

#### Initialize directory

Back up an old directory and initialize new directory with Vagrant image.

```console
mv ${PACKER_CENTOS_ECLIPSE_CPP} ${PACKER_CENTOS_ECLIPSE_CPP}.$(date +%s)
mkdir ${PACKER_CENTOS_ECLIPSE_CPP}
cd ${PACKER_CENTOS_ECLIPSE_CPP}
vagrant init packer-centos-eclipse-cpp-virtualbox
```

#### Enable remote login

Modify Vagrantfile to allow remote login by
uncommenting `config.vm.network` in `${PACKER_CENTOS_ECLIPSE_CPP}/Vagrantfile`. 
Example:

```console
sed -i.$(date +'%s') \
  -e 's/# config.vm.network \"public_network\"/config.vm.network \"public_network\"/g' \
  ${PACKER_CENTOS_ECLIPSE_CPP}/Vagrantfile
```

#### Start guest machine

```console
cd ${PACKER_CENTOS_ECLIPSE_CPP}
vagrant up
```

### Login to guest machine

```console
cd ${PACKER_CENTOS_ECLIPSE_CPP}
vagrant ssh
```

### Find guest machine IP address

In the vagrant machine, find the IP address.

```console
ip addr show
```

### Remote login to guest machine

SSH login from a remote machine.

```console
ssh vagrant@nn.nn.nn.nn
```

Password: vagrant

### Remove image from Vagrant library

To remove Vagrant image, on host machine:

```console
vagrant box remove packer-centos-eclipse-cpp-virtualbox
```

## References
1. [Build dependencies](https://github.com/docktermj/KnowledgeBase/blob/master/build-dependencies/packer.md).
1. [Bibliography](https://github.com/docktermj/KnowledgeBase/blob/master/bibliography/packer.md)
