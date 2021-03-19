from alpine:3.12

RUN	apk add openrc vim mysql mysql-client php7-mbstring

COPY	./my.cnf /etc/mysql/my.cnf
COPY	./db.sql .

EXPOSE 3306
COPY ./init.sh .
RUN	chmod +x init.sh
CMD ./init.sh
