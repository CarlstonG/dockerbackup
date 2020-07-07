#!/bin/bash

if [[ $WITH_INSTALL == "true" ]]
then
  cd /var/www/backend
  php /tmp/composer.phar install
  php artisan key:generate
  php artisan jwt:secret --force
  php artisan migrate
  php artisan db:seed
  php artisan storage:link
  npm install
fi
cp /tmp/conf/php.ini 	/etc/php/7.4/fpm/php.ini
mkdir /run/php
php-fpm7.4 -F