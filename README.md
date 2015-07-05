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
Method 1: Place your repo link in the configs.yaml under "softswich".
