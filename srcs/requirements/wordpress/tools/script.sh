#!/bin/bash

sed -i "s/define( 'DB_NAME', 'my_database' );/define( 'DB_NAME', ${DATABASE} );/g" /var/www/wordpress/wp-config.php
sed -i "s/define( 'DB_USER', 'my_user' );/define( 'DB_USER', ${DB_USER} );/g" /var/www/wordpress/wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'my_db_password' );/define( 'DB_PASSWORD', ${DB_PASSWORD} );/g" /var/www/wordpress/wp-config.php
