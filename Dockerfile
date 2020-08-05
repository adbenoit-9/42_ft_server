# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/04 00:40:04 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/05 16:33:57 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

COPY ./srcs/sh_unzip.sh init/
COPY ./srcs/sh_run.sh init/
COPY ./srcs/sh_ssl.sh init/
COPY ./srcs/sh_default.sh init/
COPY ./srcs/sh_onoff.sh init/
COPY ./srcs/init_mysql.sql init/
COPY ./srcs/index.htm init/
COPY ./srcs/latest.tar.gz var/www/html/
COPY ./srcs/phpmyadmin.tar var/www/html/

COPY ./srcs/nginx.conf etc/nginx/nginx.conf
COPY ./srcs/defaulton /etc/nginx/sites-available/default
COPY ./srcs/defaulton init/
COPY ./srcs/defaultoff init/

RUN apt-get update && apt-get upgrade -y \
&& apt-get install nginx default-mysql-server php php-mbstring php-fpm php-mysql openssl nano -y

EXPOSE 80
EXPOSE 443
CMD bash init/sh_run.sh
