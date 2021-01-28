FROM ubuntu:latest
WORKDIR .
COPY . app/

# Install packages and extensions depended on Laravel.
RUN echo 'Aquire::http { Proxy "http://172.17.0.2.3142";};' > /etc/apt/apt.conf.d/01proxy
RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 php libapache2-mod-php php-mysql sqlite php-curl php-gd php-intl php-json php-mbstring php-xml php-zip git unzip wget curl
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet

# Install and configure Laravel and plugins
RUN php composer.phar create-project --prefer-dist laravel/laravel blog
RUN sqlite3 blog/database/lara.db ""
RUN cd blog
RUN sed -i "s/DB_CONNECTION=mysql/DB_CONNECTION=sqlite/g" .env
RUN sed -i "s|DB_DATABASE=laravel|DB_DATABASE=/blog/database/lara.db|g" .env
RUN sed -i "s/DB_USERNAME=root//g" .env
RUN sed -i "s/DB_PASSWORD=//g" .env

RUN php ../composer.phar require laravel/ui --dev && php artisan ui vue --auth && npm install && npm run dev
RUN cp -ru /app/* . | true
RUN php ../composer.phar  require austintoddj/canvas && yes | php artisan migrate && php artisan canvas:install && php artisan storage:link && php artisan canvas:ui && npm install && npm run dev
