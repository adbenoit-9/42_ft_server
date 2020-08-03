# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/03 17:59:58 by adbenoit          #+#    #+#              #
#    Updated: 2020/08/03 19:32:54 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

[ -z "${USER}" ] && export USER='adbenoit'
docker_path="/goinfre/$USER/docker"

################################## Docker ######################################

# 1. Uninstall is it is intalled with brew
brew uninstall -f docker

# 2. Install
