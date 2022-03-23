#
# db2_profile::database::db_users
#
# @summary This class contains the definition for all the database users you'd like on your system.
# When these customizations aren't enough, you can replace the class with your own class. See [db2_profile::database](./database.html) for an explanation on how to do this.
#
# @param [Hash] list
#    A list of database users to define.
#    You must specify a Hash of [db2_user](/docs/db2_config/db2_user.html)
#    The default value is: `{}`
#    This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nigtmare. Our advise is when you need to let puppet manage your Oracle profiles, to override this class and  add your own puppet implementation. This is much better maintainable
#    and adds more consistency.
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_groups (
  Hash $list,
) {
  easy_type::debug_evaluation() # Show local variable on extended debug

  if $list.keys.size > 0 {
    echo { "Ensure DB group(s) ${list.keys.join(',')}":
      withpath => false,
    }
  }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml becomes a nigtmare. Our advise is when you need
  # to let Puppet manage your DB2 groups, to override this class and 
  # add your own Puppet implementation. This is a much better, more
  # maintainable, and adds more consistency.
  #
  ensure_resources(db2_group, $list)
}
