#
# db2_profile::database::db_roles
#
# @summary This class allows you to specify what DB2 database role you want to define on your databases.
# Check the documentation of [db2_role](/docs/db2_config/db2_role) on how to do this and what properties you can define on an role.
#
# @param [Hash] list
#    The list of [db2_role](/docs/db2_config/db2_role.
#    html) roles you want `db2_profile::database` to create and manage for you.
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_roles (
  Hash $list,
) {
  easy_type::debug_evaluation() # Show local variable on extended debug

  if $list.keys.size > 0 {
    echo { "Ensure DB roles(s) ${list.keys.join(',')}":
      withpath => false,
    }
  }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml becomes a nigtmare. Our advise is when you need
  # to let Puppet manage your DB2 roles, to override this class and 
  # add your own Puppet implementation. This is a much better, more
  # maintainable, and adds more consistency.
  #
  ensure_resources(db2_role, $list)
}
