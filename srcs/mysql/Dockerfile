from alpine:3.8

RUN	apk update && apk upgrade
RUN	apk add nginx mysql mysql-client

EXPOSE 3306
COPY ./init.sh .
CMD sh init.sh
