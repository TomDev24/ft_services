FROM	alpine:3.12

RUN apk add influxdb
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz ./
RUN tar -xf telegraf-1.14.0-static_linux_amd64.tar.gz \
        && chmod +x telegraf/* \
        && cp telegraf/telegraf /usr/bin/
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY	influxdb.conf /etc/influxdb.conf
COPY	init.sh .
COPY	live.sh .
RUN	chmod +x init.sh
RUN	chmod +x live.sh

CMD	./init.sh
