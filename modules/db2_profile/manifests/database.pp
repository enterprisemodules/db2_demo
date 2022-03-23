#
# db2_profile::database
#
# @summary This is a highly customizable Puppet profile class to define an IBM DB2 database on your system.
# In it's core just adding:
# 
# ```
# contain db2_profile::database
# ```
# 
# Is enough to get an IBM DB2 database running on your system. 
# 
# But sometimes you have specific uses cases that are not handled well by the standard classes. This profile class allows you to add your own code to the execution.
# 
# ## Steps
# 
# Defining and starting an Oracle database on you system goes through several steps :
# 
# - `em_license`        (setup Enterprise Modules licenses)
# - `fact_caching`      (Configure DB2 fact caching)
# - `sysctl`            (Set required sysctl settings)
# - `limits`            (Set required security limits)
# - `groups_and_users`  (Ensure required OS groups and users)
# - `packages`          (Ensure require OS packages)
# - `firewall`          (Configure firewall for DB2 usage)
# - `db_software`       (Install the DB2 software)
# - `db_fixpack`        (Install the DB2 fixpack)
# - `db_instance`       (Ensure DB2 instances)
# - `db_definition`     (Ensure DB2 databases)
# - `db_tablespaces`    (Ensure DB2 tablespaces)
# - `db_users`          (Ensure DB2 users in database)
# - `db_roles`          (Ensure DB2 roles)
# - `db_groups`         (Ensure DB2 groups in database)
# - `db_schemas`        (Ensure DB2 schemas)
# - `db_startup`        (Esnure DB2 startup after reboot)       
# 
# 
# All these steps have a default implementation. This implementation is suitable to get started with. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file. 
# 
# ## before classes
# 
# But sometimes this is not enough and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `systctl` stage is done and before the `limits` is done. You can do this by adding the next line to your yaml data:
# 
# ```yaml
# db2_profile::database::before_sysctl:   my_profile::my_extra_class
# ```
# 
# ## after classes
# 
# You can do the same when you want to add code after one of the stage classes:
# 
# ```yaml
# db2_profile::database::after_sysctl:   my_profile::my_extra_class
# ```
# 
# ## Skipping
# 
# Sometimes organisation use different modules and mechanisms to implement a feature and you want to skip the class:
# 
# ```yaml
# db2_profile::database::sysctl:   skip
# ```
# 
# ## Replacing
# 
# Or provide your own implementation:
# 
# ```yaml
# db2_profile::database::sysctl:   my_profile::my_own_implementation
# ```
# 
# This mechanism can be used for all named steps and makes it easy to move from an easy setup with a running standard database to a fully customized setup using a lot of your own classes plugged in.
# 
# Look at the description of the steps and their properties.
#
# @param [Optional[String]] after_db_definition
#    The name of the class you want to execute directly **after** the `db_definition` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_definition:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_db_fixpack
#    The name of the class you want to execute directly **after** the `db_fixpack` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_fixpack:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_db_instance
#    The name of the class you want to execute directly **after** the `db_instance` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_instance:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_db_roles
#    The name of the class you want to execute directly **after** the `db_roles` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_roles:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_db_software
#    The name of the class you want to execute directly **after** the `db_software` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_software:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_db_startup
#    The name of the class you want to execute directly **after** the `db_startup` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_startup:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_db_tablespaces
#    The name of the class you want to execute directly **after** the `db_tablespaces` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_tablespaces:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_db_users
#    The name of the class you want to execute directly **after** the `db_users` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_users:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_db_groups
#    The name of the class you want to execute directly **after** the `db_groups` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_groups:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_db_schemas
#    The name of the class you want to execute directly **after** the `db_schemas` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_db_schemas:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_em_license
#    The name of the class you want to execute directly **after** the `em_license` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_em_license:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_fact_caching
#    The name of the class you want to execute directly **after** the `fact_caching` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_fact_caching:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_firewall
#    The name of the class you want to execute directly **after** the `firewall` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_firewall:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_groups_and_users
#    The name of the class you want to execute directly **after** the `groups_and_users` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_groups_and_users:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_limits
#    The name of the class you want to execute directly **after** the `limits` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_limits:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_packages
#    The name of the class you want to execute directly **after** the `packages` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_packages:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_sysctl
#    The name of the class you want to execute directly **after** the `sysctl` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::after_sysctl:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_definition
#    The name of the class you want to execute directly **before** the `db_definitio` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_definitio:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_fixpack
#    The name of the class you want to execute directly **before** the `db_fixpack` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_fixpack:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_instance
#    The name of the class you want to execute directly **before** the `db_instance` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_instance:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_roles
#    The name of the class you want to execute directly **before** the `db_roles` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_roles:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_software
#    The name of the class you want to execute directly **before** the `db_software` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_software:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_startup
#    The name of the class you want to execute directly **before** the `db_startup` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_startup:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_schemas
#    The name of the class you want to execute directly **before** the `db_schemas` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_schemas:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_tablespaces
#    The name of the class you want to execute directly **before** the `db_tablespaces` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_tablespaces:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_users
#    The name of the class you want to execute directly **before** the `db_users` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_users:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_schema
#    The name of the class you want to execute directly **before** the `db_schema` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_schema:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_db_groups
#    The name of the class you want to execute directly **before** the `db_groups` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_db_groups:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_em_license
#    The name of the class you want to execute directly **before** the `em_license` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_em_license:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_fact_caching
#    The name of the class you want to execute directly **before** the `fact_caching` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_fact_caching:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_firewall
#    The name of the class you want to execute directly **before** the `firewall` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_firewall:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_groups_and_users
#    The name of the class you want to execute directly **before** the `groups_and_users` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_groups_and_users:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_limits
#    The name of the class you want to execute directly **before** the `limits` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_limits:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_packages
#    The name of the class you want to execute directly **before** the `packages` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_packages:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_sysctl
#    The name of the class you want to execute directly **before** the `sysctl` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::before_sysctl:  my_module::my_class
#    ```
#
# @param [Optional[String]] db_definition
#    Use this value if you want to skip or use your own class for stage `db_definition`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_definition:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_definition:  skip
#    ```
#
# @param [Optional[String]] db_fixpack
#    Use this value if you want to skip or use your own class for stage `db_fixpack`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_fixpack:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_fixpack:  skip
#    ```
#
# @param [Optional[String]] db_instance
#    Use this value if you want to skip or use your own class for stage `db_instance`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_instance:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_instance:  skip
#    ```
#
# @param [Optional[String]] db_roles
#    Use this value if you want to skip or use your own class for stage `db_roles`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_roles:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_roles:  skip
#    ```
#
# @param [Optional[String]] db_groups
#    Use this value if you want to skip or use your own class for stage `db_groups`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_groups:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_groups:  skip
#    ```
#
# @param [Optional[String]] db_schemas
#    Use this value if you want to skip or use your own class for stage `db_schemas`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_schemas:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_schemas:  skip
#    ```
#
# @param [Optional[String]] db_software
#    Use this value if you want to skip or use your own class for stage `db_software`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_software:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_software:  skip
#    ```
#
# @param [Optional[String]] db_startup
#    Use this value if you want to skip or use your own class for stage `db_startup`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_startup:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_startup:  skip
#    ```
#
# @param [Optional[String]] db_tablespaces
#    Use this value if you want to skip or use your own class for stage `db_tablespaces`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_tablespaces:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_tablespaces:  skip
#    ```
#
# @param [Optional[String]] db_users
#    Use this value if you want to skip or use your own class for stage `db_users`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_users:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::db_users:  skip
#    ```
#
# @param [Optional[String]] em_license
#    Use this value if you want to skip or use your own class for stage `em_license`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::em_license:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::em_license:  skip
#    ```
#
# @param [Optional[String]] fact_caching
#    Use this value if you want to skip or use your own class for stage `fact_caching`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::fact_caching:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::fact_caching:  skip
#    ```
#
# @param [Optional[String]] firewall
#    Use this value if you want to skip or use your own class for stage `firewall`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::firewall:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::firewall:  skip
#    ```
#
# @param [Optional[String]] groups_and_users
#    Use this value if you want to skip or use your own class for stage `groups_and_users`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::groups_and_users:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::groups_and_users:  skip
#    ```
#
# @param [Optional[String]] limits
#    Use this value if you want to skip or use your own class for stage `limits`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::limits:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::limits:  skip
#    ```
#
# @param [Optional[String]] packages
#    Use this value if you want to skip or use your own class for stage `packages`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::packages:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::packages:  skip
#    ```
#
# @param [Optional[String]] sysctl
#    Use this value if you want to skip or use your own class for stage `sysctl`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::sysctl:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    db2_profile::database::sysctl:  skip
#    ```
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database (
  Optional[String] $after_db_definition = undef,
  Optional[String] $after_db_fixpack = undef,
  Optional[String] $after_db_groups = undef,
  Optional[String] $after_db_instance = undef,
  Optional[String] $after_db_roles = undef,
  Optional[String] $after_db_schemas = undef,
  Optional[String] $after_db_software = undef,
  Optional[String] $after_db_startup = undef,
  Optional[String] $after_db_tablespaces = undef,
  Optional[String] $after_db_users = undef,
  Optional[String] $after_em_license = undef,
  Optional[String] $after_fact_caching = undef,
  Optional[String] $after_firewall = undef,
  Optional[String] $after_groups_and_users = undef,
  Optional[String] $after_limits = undef,
  Optional[String] $after_packages = undef,
  Optional[String] $after_sysctl = undef,
  Optional[String] $before_db_definition = undef,
  Optional[String] $before_db_fixpack = undef,
  Optional[String] $before_db_groups = undef,
  Optional[String] $before_db_instance = undef,
  Optional[String] $before_db_roles = undef,
  Optional[String] $before_db_schema = undef,
  Optional[String] $before_db_schemas = undef,
  Optional[String] $before_db_software = undef,
  Optional[String] $before_db_startup = undef,
  Optional[String] $before_db_tablespaces = undef,
  Optional[String] $before_db_users = undef,
  Optional[String] $before_em_license = undef,
  Optional[String] $before_fact_caching = undef,
  Optional[String] $before_firewall = undef,
  Optional[String] $before_groups_and_users = undef,
  Optional[String] $before_limits = undef,
  Optional[String] $before_packages = undef,
  Optional[String] $before_sysctl = undef,
  Optional[String] $db_definition = undef,
  Optional[String] $db_fixpack = undef,
  Optional[String] $db_groups = undef,
  Optional[String] $db_instance = undef,
  Optional[String] $db_roles = undef,
  Optional[String] $db_schemas = undef,
  Optional[String] $db_software = undef,
  Optional[String] $db_startup = undef,
  Optional[String] $db_tablespaces = undef,
  Optional[String] $db_users = undef,
  Optional[String] $em_license = undef,
  Optional[String] $fact_caching = undef,
  Optional[String] $firewall = undef,
  Optional[String] $groups_and_users = undef,
  Optional[String] $limits = undef,
  Optional[String] $packages = undef,
  Optional[String] $sysctl = undef
) inherits db2_profile {
  $is_linux                  = $facts['kernel'] == 'Linux'
  $is_windows                = $facts['kernel'] == 'Windows'

  easy_type::debug_evaluation() # Show local variable on extended debug

  easy_type::ordered_steps([
      'db2_profile::database::em_license',
      'db2_profile::database::fact_caching',
      ['db2_profile::database::sysctl',                   { 'onlyif' => $is_linux, 'implementation' => 'easy_type::profile::sysctl' }],
      ['db2_profile::database::limits',                   { 'onlyif' => $is_linux, 'implementation' => 'easy_type::profile::limits' }],
      ['db2_profile::database::groups_and_users',         { 'onlyif' => $is_linux, 'implementation' => 'easy_type::profile::groups_and_users' }],
      ['db2_profile::database::packages',                 { 'onlyif' => $is_linux, 'implementation' => 'easy_type::profile::packages' }],
      ['db2_profile::database::firewall',                 { 'onlyif' => $is_linux, 'implementation' => 'easy_type::profile::firewall' }],
      'db2_profile::database::db_software',
      'db2_profile::database::db_fixpack',
      'db2_profile::database::db_instance',
      'db2_profile::database::db_definition',
      'db2_profile::database::db_tablespaces',
      'db2_profile::database::db_users',
      'db2_profile::database::db_roles',
      'db2_profile::database::db_groups',
      'db2_profile::database::db_schemas',
      'db2_profile::database::db_startup'
  ])
}
