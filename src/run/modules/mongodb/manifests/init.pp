class mongodb {
  exec { 'mkdir -p /mongodb/data':
    path => ['/bin']
  }
}
