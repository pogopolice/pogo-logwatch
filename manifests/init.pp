# == Class: logwatch
#
# Full description of class logwatch here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { logwatch:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class logwatch (
    $logdir   =  $logwatch::params::logdir,
    $tmpdir   =  $logwatch::params::tmpdir,
    $mailto   =  $logwatch::params::mailto,
    $mailfrom =  $logwatch::params::mailfrom,
    $print    =  $logwatch::params::print,
    $range    =  $logwatch::params::range,
    $detail   =  $logwatch::params::detail,
    $service  =  $logwatch::params::service,
    $mailer   =  $logwatch::params::mailer,
) inherits logwatch::params {

  package { 'logwatch':
    ensure => present,
  }
  file { "${logwatch::params::conf_dir}/${logwatch::params::conf_file}":
    ensure =>  file,
    owner  =>  'root',
    group  =>  'root',
    mode   =>  '0440',
    owner  =>  'root',
    source =>   'puppet:///modules/logwatch/logwatch.conf',
  }
}
