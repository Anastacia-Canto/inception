#!/bin/bash

mv ../wordpress/* .

rm -rf ../wordpress

sed -i "s/define( 'DB_NAME', 'my_database' );/define( 'DB_NAME', ${DB_NAME} );/g" wp-config.php
sed -i "s/define( 'DB_USER', 'my_user' );/define( 'DB_USER', ${DB_USER} );/g" wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'my_db_password' );/define( 'DB_PASSWORD', ${DB_PASSWORD} );/g" wp-config.php


# Launch php-fpm ignoring daemon
/usr/sbin/php-fpm7.3 -F