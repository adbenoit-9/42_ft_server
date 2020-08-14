# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/13 22:01:15 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/14 16:34:18 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update -y && \
    apt-get install nginx \
    mariadb-server \
    php-fpm \
    php-mysql \
    zip \
    # phpmyadmin \
    -y

COPY srcs/run.sh /
COPY srcs/default /etc/nginx/sites-available/
COPY srcs/nginx.conf /etc/nginx/
COPY srcs/config.sql /
COPY srcs/phpmyadmin.zip /tmp/
COPY srcs/latest.tar.gz /var/www/
COPY srcs/wordpress /etc/nginx/sites-available/
COPY srcs/phpmyadmin /etc/nginx/sites-enabled/
COPY srcs/config.inc.php /


EXPOSE 80 443

ENTRYPOINT bash /run.sh