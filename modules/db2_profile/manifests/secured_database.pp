#
# db2_profile::secured_database
#
# @summary 
#
#
# See the file "LICENSE" for the full license governing this code.
#
class db2_profile::secured_database () {
  contain db2_profile::database
  # include db2_secured::ensure_cis
}
