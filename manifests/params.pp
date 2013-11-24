# /usr/share/logwatch/default.conf/logwatch.conf

class apache::params {
  $osr_array = split($::operatingsystemrelease,'[\/\.]')
  $distrelease = $osr_array[0]
  if ! $distrelease {
    fail("Class['apache::params']: Unparsable \$::operatingsystemrelease: ${::operatingsystemrelease}")
  }

  if($::fqdn) {
    $servername = $::fqdn
  } else {
    $servername = $::hostname
  }

  if $::osfamily == 'RedHat' or $::operatingsystem == 'amazon' {
    $logdir   = '/var/log'
    $tmpdir   = '/var/cache/logwatch'
    $mailgo   = 'admin@example.com'
    $mailfrom = 'node@jpcs.lan'
    $print    = ''
    $range    = 'yesterday'
    $detail   = 'Low'
    $service  = 'All'
    $mailer   = 'sendmail -t'
  } else {
    fail("Class['apache::params']: Unsupported osfamily: ${::osfamily}")
  }
}

