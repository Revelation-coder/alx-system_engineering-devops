# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx server
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
    server {
      listen 80;
      location / {
        return 301 http://$::ipaddress/;
      }
      location = / {
        echo 'Hello World!';
      }
    }
  ",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Enable Nginx default site
file { '/etc/nginx/sites-enabled/default':
  ensure  => link,
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
  notify  => Service['nginx'],
}

# Restart Nginx service
service { 'nginx':
  ensure    => running,
  enable    => true,
  hasstatus => true,
  require   => Package['nginx'],
}

