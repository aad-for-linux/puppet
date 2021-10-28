node default {
  case $::operatingsystem {
    'Ubuntu': {
      case $::lsbdistcodename {
        'bionic': {
          package { 'libnss-aad':
            ensure => installed
          }

          package { 'pam-aad':
            ensure => installed
          }

          package { 'openvpn-auth-aad':
            ensure => installed
          }
        }
        default: {
          fail("Unsupported Ubuntu Release: ${::lsbdistcodename}")
        }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
