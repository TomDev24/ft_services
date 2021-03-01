FROM	alpine:latest

RUN apk update
RUN apk add --no-cache openrc vim nginx openssl
RUN apk add php7-common php7-session php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

RUN	wget https://wordpress.org/latest.tar.gz
RUN	mkdir -p /www/localhost
RUN	tar -xf latest.tar.gz && mv wordpress/* /www/localhost
COPY	./wp_config.php /www/localhost/
COPY	./nginx.conf /etc/nginx/conf.d/default.conf
RUN	chown -R nginx:nginx /www/localhost

COPY	init.sh .
RUN	mkdir -p /run/nginx/

EXPOSE	5050
RUN chmod +x init.sh
CMD ./init.sh
