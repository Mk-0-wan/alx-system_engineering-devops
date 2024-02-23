# creates a school file in the temp folder
node default {
file { '/tmp/school' :
ensure  => file,
path    => '/tmp/school',
mode    => '0744',
owner   => 'www-data',
group   => 'www-data',
content => 'I love Puppet'
}
}
