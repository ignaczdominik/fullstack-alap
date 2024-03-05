FROM php:8.2-fpm-alpine3.17

RUN adduser -u 1000 -s /bin/fish -D phpdocker


WORKDIR /www

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk update && apk add --no-cache \
    libpng-dev \
    zip \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    curl \
    oniguruma-dev \
    libxml2-dev \
    vim \
    fish
    

RUN docker-php-ext-configure pdo && \
    docker-php-ext-configure pdo_mysql && \
    docker-php-ext-configure zip && \
    docker-php-ext-configure exif && \
    docker-php-ext-configure pcntl && \
    docker-php-ext-configure gd

RUN docker-php-ext-install  pdo \
                            pdo_mysql \
                            zip \
                            exif \
                            pcntl \
                            gd




COPY ../composer.json /www/composer.json
COPY ../composer.lock /www/composer.lock
RUN chown -R phpdocker:phpdocker /www

USER phpdocker


# RUN composer require -vvv --prefer-install=source --prefer-lowest -w --no-install \
#     guzzlehttp/guzzle:7.8.0 \
#     laravel/framework:10.29 \
#     laravel/sanctum:3.3.1 \
#     laravel/tinker:2.8.2 \
#     fakerphp/faker:1.23.0 \
#     laravel/pint:1.13.4 \
#     laravel/sail:1.26.0 \
#     mockery/mockery:1.6.6 \
#     nunomaduro/collision:7.10.0 \
#     phpunit/phpunit:10.4.1 \
#     spatie/laravel-ignition:2.3.1 

RUN composer install --no-autoloader --no-scripts -vvv
    

CMD ["php-fpm"]
