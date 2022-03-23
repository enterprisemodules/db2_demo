#
# db2_profile::db2_profile
#
# @summary Common variables
#
#
# @param location
#    The locatin where the DB2 sofware is or will be installed.
#
# @param source
#    The location of the DB2 software.
#    Here is an example on how to use this:
#        class { '::db2_install::...':
#          ...
#          source => '/software',
#          ...
#        }
#
# @param version
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
class db2_profile (
  String[1] $location,
  Stdlib::Absolutepath $source,
  Db2_Install::Version $version,
) {}
