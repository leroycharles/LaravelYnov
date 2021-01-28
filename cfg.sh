#!/bin/bash
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 php libapache2-mod-php php-mysql sqlite php-curl php-gd php-intl apt-utils php-json php-mbstring php-xml php-zip git unzip wget curl
 curl -sL https://deb.nodesource.com/setup_15.x | bash -
 DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
 wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet

 sqlite3 database/lara.db ""
 php composer.phar require laravel/ui --dev
 pwd && ls -alhs
 php artisan ui vue --auth
 npm install && npm run dev
 php composer.phar  require austintoddj/canvas
 yes | php artisan migrate
php artisan canvas:install && php artisan storage:link && php artisan canvas:ui
 npm install && npm run dev
