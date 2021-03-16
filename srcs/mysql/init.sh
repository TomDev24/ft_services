#! /bin/sh

openrc boot
rc-update add mariadb
/etc/init.d/mariadb setup
rc-service mariadb start

mysql --user='root' --execute="CREATE DATABASE wp;"
mysql --user='root' --execute="CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_user'"
mysql --user='root' --execute="GRANT ALL ON wp.* TO 'wp_user'@'%' IDENTIFIED BY 'wp_user'"
mysql --user='root' --execute="FLUSH PRIVILEGES"

#mysql --user='root' --execute="show databases;"

tail -f /dev/null
