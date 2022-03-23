
[![Enterprise Modules](https://raw.githubusercontent.com/enterprisemodules/public_images/master/banner1.jpg)](https://www.enterprisemodules.com)

#### Table of Contents

- [Overview](#overview)
- [License](#license)
- [Description](#description)
- [Setup](#setup)
  - [Requirements](#requirements)
  - [Installing the db2_profile module](#installing-the-db2_profile-module)
- [Usage](#usage)
- [Reference](#reference)
- [Limitations](#limitations)

## Overview

The `db2_profile` module allows an easy path from first simple installation to a fully customized Enterprise setup. It is part of our family of Puppet modules to install, manage and secure DB2 databases with Puppet. Besides the `db2_profile` module, this family also contains:

- [db2_install](https://www.enterprisemodules.com/shop/products/puppet-db2_install-module) For installing an DB2 databases.
- [db2_config](https://www.enterprisemodules.com/shop/products/puppet-db2_config-module) For configuring every aspect of your DB2 database
- [db2_secured](https://www.enterprisemodules.com/shop/products/puppet-oracle-security-module) To secure your databases according to the CIS benchmarks or STIG documents.

This module support DB2 version 10 and 11

## License

Most of the [Enterprise Modules](https://www.enterprisemodules.com) modules are commercial modules. This one is **NOT**. It is an Open Source module. You are free to use it any way you like. It, however, is based on our commercial Puppet DB2 modules.

## Description

The `db2_profile::database` class contains all the Puppet code to install, create and populate an Oracle database. This class is an easy way to get started. It contains the following steps:


- `em_license`        (setup Enterprise Modules licenses)
- `fact_caching`      (Configure DB2 fact caching)
- `sysctl`            (Set required sysctl settings)
- `limits`            (Set required security limits)
- `groups_and_users`  (Ensure required OS groups and users)
- `packages`          (Ensure require OS packages)
- `firewall`          (Configure firewall for DB2 usage)
- `db_software`       (Install the DB2 software)
- `db_fixpack`        (Install the DB2 fixpack)
- `db_instance`       (Ensure DB2 instances)
- `db_definition`     (Ensure DB2 databases)
- `db_tablespaces`    (Ensure DB2 tablespaces)
- `db_users`          (Ensure DB2 users in database)
- `db_roles`          (Ensure DB2 roles)
- `db_groups`         (Ensure DB2 groups in database)
- `db_schemas`        (Ensure DB2 schemas)
- `db_startup`        (Esnure DB2 startup after reboot)       

All these steps have a default implementation. This implementation is suitable to get started with. These classes all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file.

But sometimes this is not enough and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `systctl` stage is done and before the `limits` is done. You can do this by adding the next line to your yaml data:

```yaml
db2_profile::database::before_sysctl:   my_profile::my_extra_class
```
or after:

```yaml
db2_profile::database::after_sysctl:   my_profile::my_extra_class
```

If you want to, you can also skip this provided class:

```yaml
db2_profile::database::sysctl:   skip
```

Or provide your own implementation:

```yaml
db2_profile::database::sysctl:   my_profile::my_own_implementation
```

This mechanism can be used for all named stages and makes it easy to move from an easy setup with a running standard database to a fully customized setup using a lot of your own classes plugged in.

Check [here](https://www.enterprisemodules.com/docs/db2_profile/description.html) to see the full documentation for this module.

## Setup

### Requirements

The [`db2_profile`](https://www.enterprisemodules.com/shop/products/puppet-db2_config-module) module requires:
- Puppet module [`enterprisemodules-db2_config`](https://forge.puppet.com/enterprisemodules/db2_config) installed.
- Puppet module [`enterprisemodules-db2_install`](https://forge.puppet.com/enterprisemodules/db2_install) installed.
- Puppet module [`enterprisemodules-easy_type`](https://forge.puppet.com/enterprisemodules/easy_type) installed.
- Puppet module [`enterprisemodules/db2_secured`](https://forge.puppet.com/enterprisemodules/db2_secured) installed.
- Puppet module [`ipcrm-echo`](https://forge.puppet.com/ipcrm/echo) installed.
- Puppet module [`herculesteam-augeasproviders_core`](https://forge.puppet.com/herculesteam/augeasproviders_core) installed.
- Puppet module [`herculesteam-augeasproviders_sysctl`](https://forge.puppet.com/herculesteam/augeasproviders_sysctl) installed.
- Puppet module [`saz-limits`](https://forge.puppet.com/saz/limits) installed.
- Puppet module [`puppetlabs-firewall`](https://forge.puppet.com/puppetlabs/firewall) installed.
- Puppet module [`crayfishx-firewalld`](https://forge.puppet.com/crayfishx/firewalld) installed.
- Puppet module [`puppetlabs-stdlib`](https://forge.puppet.com/puppetlabs/stdlib) installed.
- Puppet version 4.0 or higher. Can be Puppet Enterprise or Puppet Open Source
- Oracle 11 higher
- A valid IBM DB2 license
- A valid Enterprise Modules license for usage.
- Runs on most Linux systems.
- Windows systems are **NOT** supported

### Installing the db2_profile module

To install these modules, you can use a `Puppetfile`

```
mod 'enterprisemodules/db2_profile'               ,'x.x.x'
```

Then use the `librarian-puppet` or `r10K` to install the software.

You can also install the software using the `puppet module`  command:

```
puppet module install enterprisemodules-db2_profile
```

## Usage

To get started, include the `db2_profile::database` class in your role and add the next hiera data for your node:

```yaml
db2_profile::database::source:                  http://myserver/my_software
db2_profile::name:                              MYDB
db2_profile::location:                          /opt/ibm/db2/V11.5
db2_profile::version:                           '11.5'
db2_profile::database::db_software::file_name:  DB2S_11.5.4_MPML.tar.gz
db2_profile::database::db_fixpack::version:     '11.5.7'
db2_profile::database::db_fixpack::file_name:   v11.5.7_linuxx64_universal_fixpack.tar.gz
```
Make sure the files:

- DB2S_11.5.4_MPML.tar.gz
- v11.5.7_linuxx64_universal_fixpack.tar.gz

Are downloaded and available in the location you specified as `db2_profile::database::source`.

Run Puppet and you have a running IBM DB2 database

## Reference

Here you can find some more information regarding this puppet module:

- [The `db2_profile` documentation](https://www.enterprisemodules.com/docs/db2_profile/description.html)

## Limitations

This module runs on most Linux versions. It requires a puppet version higher than 4. The module does **NOT** run on windows systems.
