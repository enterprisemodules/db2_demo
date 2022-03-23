class profile::db2::move_backup ()
{
  exec { 'Move DB2 backup':
    command => '/bin/mv /db2backup /vagrant/db2backup; mkdir /db2backup; chmod 755 -R /vagrant/db2backup',
    creates => '/vagrant/db2backup',
  }
}
