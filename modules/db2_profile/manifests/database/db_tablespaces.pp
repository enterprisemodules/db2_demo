#
# db2_profile::database::db_tablespaces
#
# @summary This class allows you to specify what DB2 database tablespace you want to define on your databases.
# Check the documentation of [db2_tablespace](/docs/db2_config/db2_tablespace) on how to do this and what properties you can define on an tablespace.
#
# @param [Hash] list
#    The list of [db2_tablespace](/docs/db2_config/db2_tablespace.
#    html) tablespaces you want `db2_profile::database` to create and manage for you.
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_tablespaces (
  Hash  $list,
) {
  easy_type::debug_evaluation() # Show local variable on extended debug

  if $list.keys.size > 0 {
    echo { "Ensure DB tablespace(s) ${list.keys.join(',')}":
      withpath => false,
    }
  }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nigtmare. Our advise is when you need
  # to let puppet manage your tablespaces, to override this class and
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  ensure_resources(db2_tablespace, $list)
}
