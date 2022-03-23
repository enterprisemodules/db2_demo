#
# db2_profile::database::db_definition
#
# @summary This class contains the actual database definition using the `db2_database` type.
# Here you can customize some of the attributes of your database.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [db2_config::db2_database](/docs/db2_config/db2_database.html) for an explanation on how to do this.
#
# @param [Hash] list
#    The list of [db2_database](/docs/db2_config/db2_database.
#    html) database you want `db2_profile::database` to create and manage for you.
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_definition (
  Hash $list
) {
  if $list.keys.size > 0 {
    echo { "Ensure DB2 instance(s) ${list.keys.join(',')}":
      withpath => false,
    }
  }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml becomes a nigtmare. Our advise is when you need
  # to let Puppet manage your Oracle users, to override this class and 
  # add your own Puppet implementation. This is a much better, more
  # maintainable, and adds more consistency.
  #
  ensure_resources(db2_database, $list)
}
