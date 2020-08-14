# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/13 22:04:53 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/14 16:38:48 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

cd /var/www/
tar -xzvf latest.tar.gz
rm -rf latest.tar.gz
# cp /wordpress/wp-config-sample.php /wordpress/wp-config.php
chown -R www-data:www-data wordpress
cd /
unzip /tmp/phpmyadmin.zip
mv phpMyAdmin-5.0.2-all-languages/ phpmyadmin
rm /tmp/phpmyadmin.zip
chown -R www-data: phpmyadmin
chmod -R 744 phpmyadmin
cp phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php
mv /config.inc.php /phpmyadmin/config.inc.php
ln -s /phpmyadmin /var/www/html
echo $'mysql init...'
service mysql start
mysql -u root -p < config.sql
echo $'php7.3-fpm init...'
service php7.3-fpm start
echo $'[ \033[32mok\033[0m ] Starting php7.3-fpm: php7.3-fpm ..'
echo $'nginx init...'
service nginx start
echo $'\033[34m'
bash