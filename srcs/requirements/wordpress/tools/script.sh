#!/bin/bash/

mkdir -p /run/php

#Configure PHP-fpm to listen on port 9000
sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf


chown -R www-data:www-data /var/www/wordpress && chmod 755 /var/www/wordpress
chmod 755 /var/www/wordpress/wp-config.php

# Database settings on wordpress config
sed -i "s/my_database/$DATABASE/1" /var/www/wordpress/wp-config.php
sed -i "s/my_db_user/$DB_USER/1" /var/www/wordpress/wp-config.php
sed -i "s/my_db_password/$DB_PASSWORD/1" /var/www/wordpress/wp-config.php


# Launch php-fpm ignoring daemon
/usr/sbin/php-fpm7.3 -F