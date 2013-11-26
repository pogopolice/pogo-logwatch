# /usr/share/logwatch/default.conf/logwatch.conf

class logwatch::params {
  $osr_array = split($::operatingsystemrelease,'[\/\.]')
  $distrelease = $osr_array[0]
  if ! $distrelease {
    fail("Class['logwatch::params']: Unparsable \$::operatingsystemrelease: ${::operatingsystemrelease}")
  }

  if($::fqdn) {
    $servername = $::fqdn
  } else {
    $servername = $::hostname
  }

  if $::osfamily == 'RedHat' or $::operatingsystem == 'amazon' {
    $logdir   = '/var/log'
    $tmpdir   = '/var/cache/logwatch'
    $mailto   = 'admin@example.com'
    $mailfrom = 'node@jpcs.lan'
    $print    = ''
    $range    = 'yesterday'
    $detail   = 'Low'
    $service  = 'All'
    $mailer   = 'sendmail -t'
    $conf_dir = '/usr/share/logwatch/default.conf/'
    $conf_file = 'logwatch.conf'
    $conf_template = 'logwatch/logwatch.conf.erb'
  } else {
    fail("Class['logwatch::params']: Unsupported osfamily: ${::osfamily}")
  }
}

