FROM alpine:3.12

RUN apk update && apk add vim openrc
RUN apk add libc6-compat
ADD https://dl.grafana.com/oss/release/grafana-7.4.3.linux-amd64.tar.gz ./
RUN tar -xf grafana-7.4.3.linux-amd64.tar.gz

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz ./
COPY grafana.db /grafana-7.4.3/data/
RUN tar -xf telegraf-1.14.0-static_linux_amd64.tar.gz \
        && chmod +x telegraf/* \
        && cp telegraf/telegraf /usr/bin/
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf


COPY init.sh .
RUN  chmod +x init.sh
CMD ./init.sh
