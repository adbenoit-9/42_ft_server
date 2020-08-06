# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/06 14:06:05 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/06 17:47:28 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ARG DOCUMENTROOT="/var/www/html"
ARG NGINXROOT="/etc/nginx"

# ---- NGINX ----
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install nginx -y

COPY ./srcs/nginx.conf ${NGINXROOT}/nginx.conf
COPY ./srcs/default_on ${NGINXROOT}/sites-available/default
COPY ./srcs/default_on /
COPY ./srcs/default_off /
# ---------------

# ---- MYSQL ----
RUN apt-get install -q -y mariadb-server

COPY srcs/db/articles.sql /
# ---------------

# ----- PHP -----
RUN apt-get install -q -y \
	php-mysql \
	php-mbstring \
	php-fpm \
	php openssl nano -y && \
	rm -f ${DOCUMENTROOT}/index.html && \
	apt-get autoclean -y

COPY srcs/phpmyadmin.tar ${DOCUMENTROOT}
COPY srcs/latest.tar.gz ${DOCUMENTROOT}
COPY srcs/sh_unzip.sh /
COPY srcs/app ${DOCUMENTROOT}
# ---------------

COPY srcs/sh_run.sh /
EXPOSE 80 443

WORKDIR ${DOCUMENTROOT}

ENTRYPOINT bash /sh_run.sh