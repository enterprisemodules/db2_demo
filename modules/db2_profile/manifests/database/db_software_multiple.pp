#
# db2_profile::database::db_software_multiple
#
# @summary This class allows you in install mutiple instances of DB2 sofware on your system.
#
#
# @param [Hash[String[1], Db2_profile::Sw_def]] software
#    A Hash containing the locations you want the software of a  fixpeck to be applied to.
#
# @param [String[1]] source
#    The location of the DB2 software.
#    Here is an example on how to use this:
#        class { '::db2_install::...':
#          ...
#          source => '/software',
#          ...
#        }
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_software_multiple (
  Hash[String[1], Db2_profile::Sw_def] $software,
  String[1]                 $source,
) {
  easy_type::debug_evaluation() # Show local variable on extended debug

  $software.each |$name, $properties| {
    $version   = $properties['version']
    $location  = $properties['location']
    $file_name = $properties['file_name']

    echo { "Ensure DB2 software ${version} in ${location}":
      withpath => false,
    }

    db2_install::software { "DB2 version ${version} in ${location}":
      version   => $version,
      source    => $source,
      file_name => $file_name,
      location  => $location,
    }
  }
}
