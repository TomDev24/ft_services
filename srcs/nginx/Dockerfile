# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dbrittan <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/19 03:58:05 by dbrittan          #+#    #+#              #
#    Updated: 2021/03/19 03:07:36 by dbrittan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from alpine:3.12

RUN apk update && apk upgrade 
RUN apk add nginx openssl openssh 
RUN apk add openrc

RUN mkdir -p /run/nginx/
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /www/localhost
COPY index.html /www/localhost
RUN	chown -R nginx:nginx /www/localhost


ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz ./
RUN tar -xf telegraf-1.14.0-static_linux_amd64.tar.gz \
        && chmod +x telegraf/* \
        && cp telegraf/telegraf /usr/bin/
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/site.key -out /etc/nginx/ssl/site.pem -subj "/C=RU/ST=Tar/L=Kn/O=MC/CN=s.com"

EXPOSE 80 443 22
COPY init.sh .
RUN  chmod +x init.sh
CMD ./init.sh
