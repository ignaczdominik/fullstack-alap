#!/bin/fish
composer dumpautoload
php artisan key:generate
php-fpm