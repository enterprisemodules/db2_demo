#
# db2_profile::database::db_instance
#
# @summary This class allows you to specify what DB2 database instance you want to define on your databases.
# Check the documentation of [db2_instance](/docs/db2_config/db2_instance.html) on how to do this and what properties you can define on an instance.
#
# @param [Hash] list
#    The list of [db2_instance](/docs/db2_config/db2_instance.
#    html) instances you want `db2_profile::database` to create and manage for you.
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_instance (
  Hash $list,
) {
  easy_type::debug_evaluation() # Show local variable on extended debug

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
  ensure_resources(db2_instance, $list)
}
