# manifest for kill a program called killmenow
exec { 'killmenow_process':
command  => '/usr/bin/pkill -of killmenow',
}
