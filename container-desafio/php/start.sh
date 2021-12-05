#!/usr/bin/env bash

composer install
#wait-for-it database:3306 
php bin/console doctrine:migrations:migrate
php-fpm
symfony server:start 
