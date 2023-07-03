# This Puppet manifest configures Nginx with a custom HTTP response header

# Install Nginx
package { 'nginx':
  ensure => 'installed',
}

# Configure Nginx custom header
file { '/etc/nginx/sites-available/default':
  ensure => 'file',
  content => "# Managed by Puppet\nserver {\n\tlisten 80 default_server;\n\tlisten [::]:80 default_server;\n\n\tadd_header X-Served-By $hostname;\n\n\tlocation / {\n\t\troot /var/www/html;\n\t\tindex index.html index.htm;\n\t}\n}\n",
  notify => Service['nginx'],
}

# Enable and start Nginx service
service { 'nginx':
  ensure => 'running',
  enable => true,
}
