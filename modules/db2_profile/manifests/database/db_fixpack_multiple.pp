#
# db2_profile::database::db_fixpack_multiple
#
# @summary This class ensure's that the correct DB2 fixpack is installed.
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
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::db_fixpack_multiple (
  Hash[String[1], Db2_profile::Sw_def] $software,
  String[1] $source,
  Variant[Boolean,Enum['on_failure']]
  $logoutput = lookup( { name => 'logoutput', default_value => 'on_failure' }),
  Stdlib::Absolutepath $temp_dir = '/tmp',
) {
  easy_type::debug_evaluation() # Show local variable on extended debug

  $software.each |$name, $properties| {
    $version   = $properties['version']
    $location  = $properties['location']
    $file_name = $properties['file_name']
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
