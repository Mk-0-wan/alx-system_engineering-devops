# using puppet to set up the new header content
exec { 'apt_update':
	command => 'usr/bin/apt-get update'
}

package {'nginx':
	ensure  => installed
	require => Exec['apt_update']
}

file {'/var/www/html/index.html':
	content => 'Hello World'
}

file {'/var/www/html/404.html':
	content => "Ceci n'est pas une page"
}

exec {'add_custom_header':
    command => 'sed -i "23i \\\tadd_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
    path    => '/bin:/usr/bin/',
    unless  => 'grep -qE "^\s*add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
    notify  => Service['nginx'],
}

service {'nginx':
	ensure    => running,
	enable    => true,
	require   => Package['nginx'],
	subscribe => Exec['add_custom_header'],
}
