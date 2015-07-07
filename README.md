# vagrant-p4

## Abstract
P4 is a programming language designed to allow programming of packet forwarding dataplanes. In contrast to a general purpose language such as C or python, P4 is a domain-specific language with a number of constructs optimized around network data forwarding (wikipedia).
https://en.wikipedia.org/wiki/P4_(programming_language)

P4 has documentation that can be read from their github page:
https://github.com/p4lang

## Objective
The project's goal is to encapsulate the p4 environment into a vagrant image. The environment is the translation of https://github.com/p4lang/p4factory/blob/master/install.sh into vagrant / puppet.

## Requirements
- >= Virtual Box 4.3.28
- >= Vagrant 1.6.0

## Structure
```
.
├── configs.yaml
├── puppet
│   └── manifests
│       └── p4node.pp
├── README.md
└── Vagrantfile
```

## Usage
1. Place your repo link in the configs.yaml under "softswich".
2. Bring up the vagrant image with (and wait a while):
```
vagrant up
```
3. Login into the running image:
```
vagrant ssh
```
4. If your project was successfully cloned, it should be under the /p4 directory and should contain a Makefile and main.c. For project structure, please refer to 
https://github.com/p4lang/p4factory/tree/master/targets
or
https://github.com/sniggel/p4-softswitch
5. cd into your project and input:
```
sudo make bm
```
6. (WIP) I'm still working out the details to run with mininet.

