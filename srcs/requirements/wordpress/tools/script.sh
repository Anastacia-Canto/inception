#!/bin/bash

mv ../wordpress/* .

rm -rf ../wordpress

cp wp-config-sample.php wp-config.php

sed -i "s/username_here/$DB_USER/g" wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" wp-config.php
sed -i "s/database_name_here/$DB_NAME/g" wp-config.php
sed -i "s/localhost/$DB_HOST/g" wp-config.php


wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL}
wp user create --allow-root ${WP_USER} ${WP_EMAIL} --user_pass=${WP_USER_PASS};

# Launch php-fpm ignoring daemon
/usr/sbin/php-fpm7.3 -F

exec "$@"