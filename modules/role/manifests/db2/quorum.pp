# Docs
class role::db2::quorum () {
  contain profile::base
  contain db2_profile::quorum

  Class['profile::base']
  -> Class['db2_profile::quorum']
}
