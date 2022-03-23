#
# db2_profile::database::db_startup
#
# @summary This class ensures that the specified instance will be started after a system reboot.
#
#
# @param [String[1]] instance_name
#    
#
# @param [Stdlib::Absolutepath] location
#    The locatin where the DB2 sofware is or will be installed.
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_startup (
  String[1]             $instance_name,
  Stdlib::Absolutepath  $location
) {
  easy_type::debug_evaluation() # Show local variable on extended debug

  echo { "Ensure Instance Startup for ${instance_name} in ${location}":
    withpath => false,
  }

  db2_install::autostart_instance { $instance_name:
    location => $location,
  }
}
