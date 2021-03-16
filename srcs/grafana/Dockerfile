FROM alpine:3.12

RUN apk update && apk add vim openrc
RUN apk add libc6-compat
ADD https://dl.grafana.com/oss/release/grafana-7.4.3.linux-amd64.tar.gz ./
RUN tar -xf grafana-7.4.3.linux-amd64.tar.gz

COPY ./dashboards /grafana-7.4.3/conf/provisioning/dashboards/
COPY ./providers.yaml /grafana-7.4.3/conf/provisioning/dashboards/
COPY ./datasources.yaml /grafana-7.4.3/conf/provisioning/dashboards/

COPY init.sh .
RUN  chmod +x init.sh
CMD ./init.sh
