#FROM php:7.3-fpm-stretch
FROM php:7.3-fpm-stretch
#FROM whatwedo/symfony5:v2.2-20211205
#FROM bitnami/symfony:4.4.35-debian-10-r10

RUN apt update && apt install -y

RUN apt install -y --no-install-recommends \
    git \
    zlib1g-dev \
    libxml2-dev \
    libzip-dev \
    && docker-php-ext-install \
        zip \
        intl \
        mysqli \
        pdo pdo_mysql

RUN docker-php-ext-install gd 
RUN docker-php-ext-install mbstring

RUN apt-get install -y procps vim

WORKDIR /var/www/promobit

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash

#RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN git config --global user.email "neemias.jr@gmail.com" \ 
    && git config --global user.name "Neemias Chagas de Souza Junior"

COPY . /var/www/symfony

#RUN git clone --branch "desenv" https://github.com/neemiasjr/promobit-desafio1.git



#WORKDIR /var/www/promobit/promobit-desafio1

CMD ./start.sh
