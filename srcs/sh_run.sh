# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sh_run.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/06 13:43:19 by mabriand          #+#    #+#              #
#    Updated: 2020/08/05 16:34:17 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sh init/sh_unzip.sh
echo ========="\033[1;39m Launching "MySql"... \033[0m"=========
service mysql start
mysql -u root -pPassword < init/init_mysql.sql
echo ========="\033[1;39m Launching "Php7.3-fpm"... \033[0m"========
service php7.3-fpm start
echo ========="\033[1;39m Launching "Nginx"... \033[0m"=========
openssl req -x509 -nodes -sha256 -subj '/CN=localhost' \
	-newkey rsa:2048 -keyout /etc/nginx/nginx.key -out /etc/nginx/nginx.crt
service nginx start
echo "033[1;32m === WORDPRESS SERVER OK ! === \033[0m"
sh /init/sh_onoff.sh
bash
