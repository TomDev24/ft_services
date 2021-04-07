from alpine:3.12

RUN	apk add openrc vim mysql mysql-client supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY	./my.cnf /etc/mysql/my.cnf
COPY	./db.sql .

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz ./
RUN tar -xf telegraf-1.14.0-static_linux_amd64.tar.gz \
        && chmod +x telegraf/* \
        && cp telegraf/telegraf /usr/bin/
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

HEALTHCHECK --interval=3s --timeout=3s CMD pgrep mysqld || exit 1

EXPOSE 3306
COPY ./init.sh .
RUN	chmod +x init.sh
CMD ./init.sh
