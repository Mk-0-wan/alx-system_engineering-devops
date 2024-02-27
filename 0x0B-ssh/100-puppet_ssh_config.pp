# 100_puppet_ssh_config

$ip_address = '3.85.196.185'
$mode = '0644'
$path = '/etc/ssh/ssh_config'
$content = "Host $ip_address\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no\n"

file { $path :
	ensure   => present,
	content  => $content,
	owner    => 'root',
	group    => 'root',
	mode     => $mode,

}
