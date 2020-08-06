# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sh_unzip.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/06 17:36:08 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/06 17:40:23 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

echo =========="\033[1;34m Unzip Package \033[0m"=========
tar -xf phpmyadmin.tar
cp phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php
tar -xzf latest.tar.gz
rm -rf latest.tar.gz phpmyadmin.tar
# bash /init/sh_default.sh
chown -R www-data:www-data /var/www/html
echo ["\033[32m ok \033[0m"] Package unziped.