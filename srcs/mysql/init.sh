mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mysql_install_db --user=mysql --datadir=/var/lib/mysql

usr/bin/mysqld_safe
#kill -s STOP "$(pgrep mysqld_safe)"

#mysql --user='root' --execute="CREATE DATABASE wp;"
#mysql --user='root' --execute="CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_user'"
#mysql --user='root' --execute="GRANT ALL ON wp.* TO 'wp_user'@'localhost' IDENTIFIED BY 'wp_user'"
#mysql --user='root' --execute="FLUSH PRIVILEGES"

#mysql --user='root' --execute="show databases;"

