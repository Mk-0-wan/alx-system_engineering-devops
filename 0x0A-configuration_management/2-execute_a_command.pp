# manifest for kill a program called killmenow
exec { 'killmenow_process':
command  => 'pkill -of killmenow',
path     => '/usr/bin/'
}
