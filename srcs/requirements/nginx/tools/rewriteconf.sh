#!/bin/bash

echo "
server {
	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
	ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
	ssl_protocols TLSv1.3 TLSv1.2;

	root /var/www/html;
	index index.html index.htm;

	server_name www.ansilva.42.fr ansilva.42.fr;
	location / {
		try_files $uri $uri/ =404;
	}
} " > /etc/nginx/sites-available/default

nginx -g "daemon off;"