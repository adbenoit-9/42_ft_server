# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/13 22:04:53 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/13 23:08:05 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

echo $'mysql init...'
service mysql start
echo $'php7.3-fpm init...'
service php7.3-fpm start
echo $'[ \033[32mok\033[0m ] Starting php7.3-fpm: php7.3-fpm ..'
echo $'nginx init...'
service nginx start
bash