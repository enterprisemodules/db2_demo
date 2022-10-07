[![Enterprise Modules](https://raw.githubusercontent.com/enterprisemodules/public_images/master/banner1.jpg)](https://www.enterprisemodules.com)
# Demo Puppet implementation DB2

This repo contains a demonstration of a DB2 database installation. It uses the [`db2_profile`](https://forge.puppet.com/enterprisemodules/db2_profile) module to get a quick and easy start. Although the puppet code is suitable for use with a Puppet server and/or Puppet Enterprise, the demo is setup with masterless Puppet.


## Single node DB2 setup

To Start the single node db2 setup, use:

```
$ vagrant up ml-db115
```

## HADR setup without cluster manager

There is also a HADR setup. It contains two nodes. You can start the nodes like this:

$ vagrant up ml-db115a
$ vagrant up ml-db115b

In that order. The db115a is the primary database. On the db115b the standby database is hosted.

## HADR setup **with** cluster manager

There is also a HADR setup that uses the DB2 Pacemaker integration. It contains two nodes. You can start the nodes like this:

$ vagrant up --no-provision ml-db1157b
$ vagrant up ml-db1157a
$ vagrant provision ml-db1157b

In that order. The db1157a is the primary database. On the db1157b the standby database is hosted.

## Required software

The software must be placed in `modules/software/files`. It must contain the next files:

- DB2S_11.5.4_MPML.tar.gz
- v11.5.7_linuxx64_universal_fixpack.tar.gz

You can download these files from IBM.
