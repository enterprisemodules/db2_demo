# Docs
class role::db2::simple_db()
{
  contain profile::base
  contain db2_profile::database

  Class['profile::base']
  -> Class['db2_profile::database']
}
