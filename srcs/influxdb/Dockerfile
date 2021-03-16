FROM	alpine:3.12

RUN apk add influxdb

COPY	influxdb.conf /etc/influxdb.conf
COPY	init.sh .
RUN	chmod +x init.sh
CMD	./init.sh
