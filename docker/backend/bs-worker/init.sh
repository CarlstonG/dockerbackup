#!/bin/bash

cd /var/www/backend
php artisan migrate
php artisan queue:work database --tries=1
