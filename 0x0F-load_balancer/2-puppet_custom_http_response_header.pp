# Install Nginx
package { 'nginx':
  ensure => present,
}

# Create custom Nginx configuration file
file { '/etc/nginx/conf.d/custom_http_header.conf':
  ensure  => file,
  content => 'add_header X-Served-By $hostname;',
  require => Package['nginx'],
}

# Restart Nginx to apply changes
service { 'nginx':
  ensure     => running,
  enable     => true,
  subscribe  => File['/etc/nginx/conf.d/custom_http_header.conf'],
  refreshonly => true,
}

