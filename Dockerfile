FROM php:8.0
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN apt-get update -y && apt-get install -y openssl zip unzip git libonig-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /app
COPY . /app
RUN docker-php-ext-install pdo mbstring
RUN composer update
RUN composer install
EXPOSE 8181
CMD php artisan serve --host=0.0.0.0 --port=8181
