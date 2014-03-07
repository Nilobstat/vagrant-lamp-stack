class php {

  $timezone = "Europe/Paris"
  # package install list
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "php5-json",
    "libapache2-mod-php5"
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }

  augeas { 'php_timezone':
    changes	=> [
	"set /files/etc/php5/cli/php.ini/Date/date.timezone ${timezone}",
	"set /files/etc/php5/apache2/php.ini/Date/date.timezone ${timezone}",
    ],
    require	=> Package["php5"],
  }
}
