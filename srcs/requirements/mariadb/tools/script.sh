#!/bin/bash

mkdir -p /var/run/mysqld
chmod 755 /var/run/mysqld

service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \'${DATABASE}\';"
mysql -e "CREATE USER IF NOT EXISTS \'${DB_USER}\'@'localhost' IDENTIFIED BY ${DB_PASSWORD};"
mysql -e "GRANT ALL PRIVILEGES ON \'${DATABASE}\'.* TO \'${DB_USER}\'@'%' IDENTIFIED BY ${DB_PASSWORD};"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown
exec mysqld_safe
