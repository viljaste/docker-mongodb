class mongodb {
  require mongodb::supervisor

  exec { 'mkdir -p /mongodb/data':
    path => ['/bin']
  }

  file { '/tmp':
    ensure => directory,
    recurse => true,
    force => true,
    source => 'puppet:///modules/mongodb/tmp',
  }

  exec { '/bin/su - root -c "cd /tmp && cat mongodb-linux-x86_64-2.6.6.tgz.gz.* | tar xz"':
    require => File['/tmp']
  }

  exec { 'tar xzf mongodb-linux-x86_64-2.6.6.tgz':
    cwd => '/tmp',
    path => ['/bin'],
    require => Eexc['/bin/su - root -c "cd /tmp && cat mongodb-linux-x86_64-2.6.6.tgz.gz.* | tar xz"']
  }

  exec { 'rsync -avz mongodb-linux-x86_64-2.6.6/ /opt/mongodb':
    cwd => '/tmp',
    path => ['/usr/bin'],
    require => Exec['tar xzf mongodb-linux-x86_64-2.6.6.tgz']
  }
}
