# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_docker.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/03 17:59:58 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/04 01:05:56 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# 1. Uninstall is it is intalled with brew
brew uninstall -f docker

# 2. Install
# check if Docker is already installed
while [ ! -d "/Application/Docker.app/" ] && [ ! -d "~/Applications/Docker.app/" ]
    do
    echo "\n\033[1mPlease install Docker for mac with this link\033[m \033[1;4;33mhttps://download.docker.com/mac/stable/Docker.dmg\033[m"
    # open -a "Managed Software Center"
    read -p $'\033[1mPress\033[m \033[1;7mENTER\033[0m \033[1mwhen you have successfully installed...\033[m'
done
