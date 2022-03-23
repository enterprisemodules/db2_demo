[![Enterprise Modules](https://raw.githubusercontent.com/enterprisemodules/public_images/master/banner1.jpg)](https://www.enterprisemodules.com)
# Demo Puppet implementation DB2

This repo contains a demonstration of a simple database installation. It uses the [`db2_profile`](https://forge.puppet.com/enterprisemodules/db2_profile) module to get a quick and easy start.

## Starting the node masterless

All nodes are available to test with Puppet masterless. To do so, add `ml-` for the name when using vagrant:

```
$ vagrant up ml-db115
```

## Required software

The software must be placed in `modules/software/files`. It must contain the next files:

- DB2S_11.5.4_MPML.tar.gz

