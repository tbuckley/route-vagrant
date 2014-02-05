exec { "apt-get update" :
  command => "/usr/bin/apt-get update",
  path => "/usr/bin",
}

# Install git
package { "git" :
  ensure => "installed",
  require => Exec[ "apt-get update" ],
}

# Install nodejs (order matters!)
class { "nodejs":
  version => "stable",
  require => Exec[ "apt-get update" ],
}

# Install node modules
package { "socket.io" :
  ensure => "installed",
  provider => "npm",
  require => Class[ "nodejs" ],
}