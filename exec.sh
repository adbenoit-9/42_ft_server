# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    exec.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/06 14:59:01 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/14 13:51:28 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

docker build -t webserver .
docker run -p 80:80 -p 443:443 -ti webserver

# docker rmi -f IMAGE ID => supprime une image x
# docker rmi -f $(docker images -q) => supprime toutes les images dispo sur notre mavhine
# docker rm <CONTAINER NAME ou ID>