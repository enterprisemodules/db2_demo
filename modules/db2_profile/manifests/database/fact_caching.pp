#
# db2_profile::database::fact_caching
#
# @summary This class will enable DB2 fact caching, when enabled.
#
#
# @param [Boolean] enabled
#    Boolean to determine if you want to enabled Puppet fact caching for the DB2 facts.
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::database::fact_caching (
  Boolean $enabled,
) {
  if defined('db2_config::fact_caching') {
    class { 'db2_config::fact_caching':  enabled => $enabled }
  }
  if defined('db2_install::fact_caching') {
    class { 'db2_install::fact_caching': enabled => $enabled }
  }
}
