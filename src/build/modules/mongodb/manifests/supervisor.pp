class mongodb::supervisor {
  file { '/etc/supervisor/conf.d/mongodb.conf':
    ensure => present,
    source => 'puppet:///modules/mongodb/etc/supervisor/conf.d/mongodb.conf',
    mode => 644
  }
}
