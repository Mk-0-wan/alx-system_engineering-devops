package {'nginx': ensure => installed}

file {'/var/www/html/index.html': content => 'Hello World!'}

file {'/etc/nginx/sites-available/default':
  ensure  => file,
  content => "server {

    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;

    # Add index.php to the list if you are using PHP
    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files \$uri \$uri/ =404;
    }
    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
    error_page 404 /404.html;
        location = /404.html {
        root /var/www/html;
                internal;
        }

 }",
}

service {'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}
