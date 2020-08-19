# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/13 22:01:15 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/19 19:52:35 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update -y && \
    apt-get install nginx \
    mariadb-server \
    php-fpm \
    php-mysql \
    sed \
    openssl \
    # phpmyadmin \
    -y

COPY srcs/run.sh /
COPY srcs/default /etc/nginx/sites-available/
COPY srcs/nginx.conf /etc/nginx/
COPY srcs/config.sql /
COPY srcs/phpmyadmin.tar.gz /tmp/
COPY srcs/latest.tar.gz /tmp/
COPY srcs/config.inc.php /

EXPOSE 80 443

ENTRYPOINT bash /run.sh