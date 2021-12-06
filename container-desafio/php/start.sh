#!/bin/bash
set -e

cd /var/www/symfony/
composer install
#wait-for-it database:3306 
php /var/www/symfony/bin/console doctrine:migrations:migrate
php-fpm