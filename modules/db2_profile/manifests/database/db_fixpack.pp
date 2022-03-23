#
# db2_profile::database::db_fixpack
#
# @summary This class ensure's that the correct DB2 fixpack is installed.
#
#
# @param [Stdlib::Absolutepath] temp_dir
#    This defined type uses a temporary directory.
#    By default this is `\tmp`. If you want to use an other directory for this, you must specify this parameter.
#    Here is an example on how to use this:
#        class { '::db2_install::...':
#          ...
#          temp_dir => '/my_tmp_dir',
#          ...
#        }
#    On systems with a secured `/tmp` direcory, you MUST specify the `tmp_dir` parameter and specify a directory that puppet is allowed to execute scripts from. It must also have enough space to receive the extracted MQ installation kit.
#
# @param [Optional[String[1]]] version
#    The version to be installed.
#    Here is an example on how to use this:
#        class { '::db2_install::software':
#          ...
#          version => '11.0.0.0',
#          ...
#        }
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
# @param [Optional[String[1]]] file_name
#    The file containing the install kit for the DB2 software.
#
# @param [Stdlib::Absolutepath] location
#    The locatin where the DB2 sofware is or will be installed.
#
# @param [Variant[Boolean, Enum['on_failure']]] logoutput
#    If you want to see the output of the `exec` resources in the type, you can set this value to `true`.
#    The default is `on_failure`.
#    Here is an example on how to use this:
#        class { '::db2_install::...':
#          ...
#          logoutput => true,
#          ...
#        }
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_fixpack (
  Stdlib::Absolutepath $location,
  String[1] $source,
  Optional[String[1]] $file_name = undef,
  Variant[Boolean,Enum['on_failure']]
  $logoutput = lookup( { name => 'logoutput', default_value => 'on_failure' }),
  Stdlib::Absolutepath $temp_dir = '/tmp',
  Optional[String[1]] $version = undef
) {
  easy_type::debug_evaluation() # Show local variable on extended debug

  if $version {
    echo { "Ensure DB2 fixpack version ${version} on ${location}":
      withpath => false,
    }
    #
    # Now we need the file name
    #
    assert_type(String[1], $file_name)

    db2_install::fixpack { "Fixpack ${version} in ${location}":
      version   => $version,
      source    => $source,
      location  => $location,
      file_name => $file_name,
      temp_dir  => $temp_dir,
    }
  }
}
