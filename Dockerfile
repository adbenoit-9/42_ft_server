# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/04 00:40:04 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/04 01:11:21 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

COPY ./srcs/sh_unzip.sh srcs/
COPY ./srcs/sh_run.sh srcs/
COPY ./srcs/sh_ssl.sh srcs/
COPY ./srcs/sh_default.sh srcs/
COPY ./srcs/sh_onoff.sh srcs/
COPY ./srcs/init_mysql.sql srcs/
COPY ./srcs/index.htm srcs/
COPY ./srcs/latest.tar.gz var/www/html/
COPY ./srcs/phpmyadmin.tar var/www/html/

COPY ./srcs/nginx.conf etc/nginx/nginx.conf
COPY ./srcs/defaulton /etc/nginx/sites-available/default
COPY ./srcs/defaulton srcs/
COPY ./srcs/defaultoff srcs/

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx default-mysql-server php php-mbstring php-fpm php-mysql openssl nano -y

EXPOSE 80
EXPOSE 443
ENTRYPOINT bash srcs/sh_run.sh
