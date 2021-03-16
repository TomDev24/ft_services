from alpine:3.12.4

RUN apk update && apk upgrade
#RUN echo -e "https://dl-cdn.alpinelinux.org/alpine/v3.13/main\nhttps://dl-cdn.alpinelinux.org/alpine/v3.13/community" > /etc/apk/repositories
RUN apk add vim  
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz ./
#--repository http://dl-3.alpinelinux.org/alpine/edge/testing --allow-untrusted --no-cache 
#RUN wget http://dl-cdn.alpinelinux.org/alpine/v3.13/community/aarch64/telegraf-1.17.0-r0.apk 
#RUN apk add --allow-untrusted ./telegraf-1.17.0-r0.apk 

RUN tar -xf telegraf-1.14.0-static_linux_amd64.tar.gz \
	&& chmod +x telegraf/* \
	&& cp telegraf/telegraf /usr/bin/
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY init.sh .
RUN  chmod +x init.sh
CMD ./init.sh
