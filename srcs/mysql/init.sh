#! /bin/sh

openrc boot
rc-update add mariadb
#/usr/bin/mysql_install_db --datadir=/var/lib/mysql
/etc/init.d/mariadb setup
rc-service mariadb start

telegraf &
mysql --user='root' --execute="CREATE DATABASE wp; use wp"
mysql --user='root' --execute="SET PASSWORD FOR 'root'@'%' = PASSWORD('root');"
mysql --user='root' --execute="CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_user'"
mysql --user='root' --execute="GRANT ALL ON wp.* TO 'wp_user'@'%' IDENTIFIED BY 'wp_user'"
mysql --user='root' --execute="FLUSH PRIVILEGES"
mysql -u root --skip-password < wp.sql

#rc-service mariadb stop
#rc-service mariadb start
#/usr/bin/mysqld_safe 
tail -f /dev/null
