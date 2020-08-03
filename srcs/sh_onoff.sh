#!/bin/bash
cd /etc/nginx/sites-available
search=`cat default | grep autoindex`
basic="		autoindex on;"
if [ "$search" != "$basic" ]
then
	echo autoindex on
	rm /var/www/html/index.php
	cp /init/default_on /etc/nginx/sites-available/default
	service nginx restart
else
	echo autoindex off
	cp /init/index.php /var/www/html/
	cp /init/default_off  /etc/nginx/sites-available/default
	service nginx restart
fi


