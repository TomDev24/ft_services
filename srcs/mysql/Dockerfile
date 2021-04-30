from alpine:3.12

RUN	apk add openrc vim mysql mysql-client supervisor

COPY	./my.cnf /etc/mysql/my.cnf
COPY	./wp.sql .

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz ./
RUN tar -xf telegraf-1.14.0-static_linux_amd64.tar.gz \
        && chmod +x telegraf/* \
        && cp telegraf/telegraf /usr/bin/
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY supervisor.conf /etc/

EXPOSE 3306
COPY ./init.sh .
COPY ./live.sh .
RUN	chmod +x init.sh
RUN	chmod +x live.sh
CMD ./init.sh
