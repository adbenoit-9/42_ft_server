# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/13 22:01:15 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/20 19:02:57 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV ROOT=/var/www/html

RUN apt-get update -y && \
    apt-get install nginx \
    mariadb-server \
    php-fpm \
    php-mysql \
    sed \
    openssl \
    -y

COPY srcs/default /etc/nginx/sites-available/
COPY srcs/nginx.conf /etc/nginx/
COPY srcs/config.sql /
COPY srcs/phpmyadmin.tar.gz /tmp/
COPY srcs/latest.tar.gz /tmp/
COPY srcs/config.inc.php /

RUN \
    if [ "$AUTOINDEX" = "on" ] ; then \
	    sed -i '11i\	autoindex on;' /etc/nginx/sites-available/default \
	    && rm -rf /var/www/html/index* ; fi

RUN tar -xzvf /tmp/latest.tar.gz -C $ROOT/ \
    && chown -R www-data:www-data $ROOT/wordpress \
    && tar -xzvf /tmp/phpmyadmin.tar.gz -C $ROOT/ \
    && rm /tmp/* \
    && chown -R www-data: $ROOT/ \
    && chmod -R 744 $ROOT/phpmyadmin \
    && mv /config.inc.php $ROOT/phpmyadmin/config.inc.php \
    unlink /etc/nginx/sites-enabled/default \
    && ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/ \
    && service mysql start \
    && mysql -u root -pt < config.sql \
    && cp $ROOT/phpmyadmin/config.sample.inc.php $ROOT/phpmyadmin/config.inc.php \
    && echo -n $'[ ... ] Starting php7.3-fpm: php7.3-fpm ..' \
    && service php7.3-fpm start \
    && echo -e $'\r[ \033[32mok\033[0m ] Starting php7.3-fpm: php7.3-fpm' \
    && openssl req -x509 -out etc/nginx/localhost.crt \
    -keyout etc/nginx/localhost.key -newkey rsa:2048 -nodes -sha256 \
    -subj '/CN=localhost' \
    && echo -e $'[ \033[32mok\033[0m ] Generating a RSA private key' \
    && service nginx start \
    && bash

EXPOSE 80 443
