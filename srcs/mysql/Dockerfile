from alpine:3.12

RUN	apk add openrc vim mysql mysql-client supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY	./my.cnf /etc/mysql/my.cnf
COPY	./db.sql .

HEALTHCHECK --interval=3s --timeout=3s CMD pgrep mysqld || exit 1

EXPOSE 3306
COPY ./init.sh .
RUN	chmod +x init.sh
CMD ./init.sh
