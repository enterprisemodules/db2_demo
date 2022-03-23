#
# db2_profile::database::db_software
#
# @summary This class installs the IBM DB2 sofware on your system.
#
#
# @param [String[1]] file_name
#    The file containing the install kit for the DB2 software.
#
# @param [Stdlib::Absolutepath] location
#    The locatin where the DB2 sofware is or will be installed.
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
# @param [Db2_Install::Version] version
#    The version to be installed.
#    Here is an example on how to use this:
#        class { '::db2_install::software':
#          ...
#          version => '11.0.0.0',
#          ...
#        }
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_software (
  String[1]             $file_name,
  Stdlib::Absolutepath  $location,
  String[1]             $source,
  Db2_Install::Version  $version
) {
  easy_type::debug_evaluation() # Show local variable on extended debug

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
