class tripwire (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific|ubuntu)/ => 'tripwire',
  }

  $paths = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific|ubuntu)/ => [
      '/etc/tripwire',
      '/var/lib/tripwire'
    ],
  }

  package { $required: ensure => $ensure }

  file { $paths:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

}
