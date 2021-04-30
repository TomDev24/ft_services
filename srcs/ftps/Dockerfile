FROM alpine:3.12

RUN	apk add openrc vim vsftpd openssl

COPY	vsftpd.conf /etc/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/site.pem -out /etc/ssl/site.pem -subj "/C=RU/ST=Tar/L=Kn/O=MC/CN=s.com"

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz ./
RUN tar -xf telegraf-1.14.0-static_linux_amd64.tar.gz \
        && chmod +x telegraf/* \
        && cp telegraf/telegraf /usr/bin/
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21 20 64000 
COPY ./init.sh .
RUN	chmod +x init.sh
COPY ./live.sh .
RUN	chmod +x live.sh

CMD ./init.sh
