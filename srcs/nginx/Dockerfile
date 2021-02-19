# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dbrittan <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/19 03:58:05 by dbrittan          #+#    #+#              #
#    Updated: 2021/02/19 06:45:59 by dbrittan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from alpine:3.8

RUN apk update && apk upgrade 
#RUN echo -e "http://nl.alpinelinux.org/alpine/v3.5/main\nhttp://nl.alpinelinux.org/alpine/v3.5/community" > /etc/apk/repositories f
RUN apk add nginx openssl openssh 

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/site.key -out /etc/nginx/ssl/site.pem -subj "/C=RU/ST=Tar/L=Kn/O=MC/CN=s.com"

RUN mkdir -p /run/nginx/
EXPOSE 80 443 22
CMD ["nginx", "-g", "daemon off;"]

