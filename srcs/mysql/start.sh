mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mysql_install_db --user=mysql --datadir=/var/lib/mysql
/usr/bin/mysqld_safe
#mysql -u root

mysql --user='root' --execute="CREATE DATABASE wp;"
mysql --user='root' --execute="CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_user'"
mysql --user='root' --execute="GRANT ALL ON wp.* TO 'wp_user'@'localhost' IDENTIFIED BY 'wp_user'"
mysql --user='root' --execute="FLUSH PRIVILEGES"

#and i am in console mode
#https://stackoverflow.com/questions/11657829/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run

