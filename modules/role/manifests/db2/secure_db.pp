# Docs
class role::db2::secure_db()
{

  contain profile::base
  contain db2_profile::secured_database

  Class['profile::base']
  -> Class['db2_profile::secured_database']
}
