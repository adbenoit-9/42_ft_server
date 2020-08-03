# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sh_unzip.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mabriand <mabriand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/06 10:07:10 by mabriand          #+#    #+#              #
#    Updated: 2020/02/11 18:15:18 by mabriand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

cd var/www/html/
tar -xf phpmyadmin.tar
cp phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php
tar -zxf latest.tar.gz
rm -rf latest.tar.gz phpmyadmin.tar
cp /init/index.php /var/www/html/
chown -R www-data:www-data /var/www/html
rm /var/www/html/index*.html
echo "[\033[1;32m Package unzipped ! \033[0m]"
