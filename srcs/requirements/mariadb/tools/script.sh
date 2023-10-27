#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mkdir -p /var/run/mysqld
chmod 755 /var/run/mysqld

mysqld;
mysql -e "CREATE DATABASE IF NOT EXISTS \'${DATABASE}\';"
mysql -e "CREATE USER IF NOT EXISTS \'${DB_USER}\'@'localhost' IDENTIFIED BY ${DB_PASSWORD};"
mysql -e "GRANT ALL PRIVILEGES ON \'${DATABASE}\'.* TO \'${DB_USER}\'@'%' IDENTIFIED BY ${DB_PASSWORD};"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysql -u ${DB_USER} -p ${DB_PASSWORD} -h 127.0.0.1 ${DATABASE}

