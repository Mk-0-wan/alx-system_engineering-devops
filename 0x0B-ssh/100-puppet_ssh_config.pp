# 100_puppet_ssh_config

exec {'ssh_puppet_configuration':
  path    => '/usr/bin:/bin',
  command => 'echo -e "Host 3.85.196.185\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no" >> /etc/ssh/ssh_config',
}
