from alpine:3.12

RUN	apk add openrc vim mysql mysql-client

COPY	./my.cnf /etc/mysql/my.cnf
COPY	./mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306
COPY ./init.sh .
RUN	chmod +x init.sh
CMD ./init.sh
