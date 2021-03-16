FROM	alpine:3.12

RUN apk update
RUN apk add --no-cache openrc vim nginx openssl
RUN apk add php7-common php7-session php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

RUN	mkdir -p /www/localhost
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz 
RUN	tar -xf phpMyAdmin-5.0.4-all-languages.tar.gz 
RUN	mv ./phpMyAdmin-5.0.4-all-languages/* /www/localhost/
COPY	./nginx.conf /etc/nginx/conf.d/default.conf
COPY	./config.inc.php /www/localhost/config.inc.php
RUN	chown -R nginx:nginx /www/localhost

COPY init.sh .
EXPOSE 5000
RUN chmod +x init.sh
CMD ./init.sh
