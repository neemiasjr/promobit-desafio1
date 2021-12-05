FROM php:7.3-fpm-stretch
RUN apt update \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

RUN apt-get update -y && apt-get install -y libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev \
    libfreetype6-dev
RUN apt-get install -y \
        zlib1g-dev
RUN docker-php-ext-install gd 
RUN docker-php-ext-install mbstring 
RUN docker-php-ext-install mysqli pdo pdo_mysql

WORKDIR /var/www/promobit

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
RUN git config --global user.email "neemias.jr@gmail.com" \ 
    && git config --global user.name "Neemias Chagas de Souza Junior"


RUN git clone https://github.com/neemiasjr/promobit-desafio1.git

WORKDIR /var/www/promobit/promobit-desafio1

CMD composer install; wait-for-it database:3306 -- bin/console doctrine:migrations:migrate; php-fpm 
