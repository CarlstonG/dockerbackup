#!/bin/bash

while [ true ]
do
  php /var/www/backend/artisan schedule:run --verbose --no-interaction &
  sleep 60
done
