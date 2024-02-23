# manifest for kill a program called killmenow
exec { 'killmenow_process':
command     => 'pkill -of killmenow',
refreshonly => true,
}
