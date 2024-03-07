# using puppet to set up the new header content
package {'nginx':
	ensure => installed
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
	onlyif  => 'test ! -z "$(grep -E "^\s*add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default)"',
	notify  => Service['nginx'],
}

service {'nginx':
	ensure    => running,
	enable    => true,
	require   => Package['nginx'],
	subscribe => Exec['add_custom_header'],
}
