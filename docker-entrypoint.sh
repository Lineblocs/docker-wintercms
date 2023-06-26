#!/usr/bin/env sh
set -e

echo "ENV is: "
printenv

cat config/database.php
php artisan config:clear
php artisan config:cache
php artisan winter:up

exec docker-php-entrypoint "$@"