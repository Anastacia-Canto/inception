#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chmod 777 /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql


# tail -f /dev/null

if [ -d "/var/lib/mysql/$DB_NAME" ]
then 
	echo "Database already exists"
else
mysql_install_db

service mysql start

mysql_secure_installation <<_EOF_

Y
$DB_ROOT_PASSWORD
$DB_ROOT_PASSWORD
Y
n
Y
Y
_EOF_

sleep 3

mysql --user=root << _EOF_
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
_EOF_


mysql --user=root --password=$DB_ROOT_PASSWORD << _EOF_
CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
_EOF_

mysqladmin -uroot -p$DB_ROOT_PASSWORD shutdown

fi


exec mysqld_safe --bind-address=0.0.0.0