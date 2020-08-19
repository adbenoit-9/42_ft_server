# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/13 22:04:53 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/19 20:50:06 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ $AUTOINDEX == "on" ]
then
	sed -i '11i\	autoindex on;' /etc/nginx/sites-available/default
	rm -rf /var/www/html/index*
fi

cd /var/www/html
tar -xzvf /tmp/latest.tar.gz
chown -R www-data:www-data wordpress
tar -xzvf /tmp/phpmyadmin.tar.gz
rm /tmp/*
chown -R www-data: phpmyadmin
chmod -R 744 phpmyadmin
mv /config.inc.php phpmyadmin/config.inc.php
cd /

unlink /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

service mysql start
mysql -u root -pt < config.sql
cp var/www/html/phpmyadmin/config.sample.inc.php var/www/html/phpmyadmin/config.inc.php
echo -n $'[ ... ] Starting php7.3-fpm: php7.3-fpm ..'
service php7.3-fpm start
echo -e $'\r[ \033[32mok\033[0m ] Starting php7.3-fpm: php7.3-fpm'
cd etc/nginx
touch output.txt
openssl req -x509 -out localhost.crt -keyout localhost.key \
	-newkey rsa:2048 -nodes -sha256 -subj '/CN=localhost' > output.txt
rm output.txt
cd /
echo -e $'[ \033[32mok\033[0m ] Generating a RSA private key'
service nginx start

echo $'\033[34m'
bash
