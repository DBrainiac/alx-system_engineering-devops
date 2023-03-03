# fix it and then automate it using Puppet 

exec {'replace':
  provider => shell,
  command => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}
