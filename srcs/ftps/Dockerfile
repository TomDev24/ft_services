from alpine:3.12

RUN	apk add openrc vim vsftpd openssl

COPY	vsftpd.conf /etc/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/site.pem -out /etc/ssl/site.pem -subj "/C=RU/ST=Tar/L=Kn/O=MC/CN=s.com"

EXPOSE 21 20 64000 
COPY ./init.sh .
RUN	chmod +x init.sh
CMD ./init.sh
