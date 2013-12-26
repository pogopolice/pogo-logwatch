# Set the root alias for mailing of logwatches

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
    $logwatch_address	= 'admin@example.com'
    $alias_conf_dir	= '/etc/'
    $alias_conf_file	= 'aliases'
    $alias_conf_template = 'logwatch/aliases.erb'
  } else {
    fail("Class['logwatch::params']: Unsupported osfamily: ${::osfamily}")
  }
}

