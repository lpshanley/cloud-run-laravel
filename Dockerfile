FROM composer:1.9.0 as build
WORKDIR /usr/src/app
COPY app .
RUN composer global require hirak/prestissimo && composer install

FROM php:7.3-apache-stretch
RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 8080
COPY --from=build /usr/src/app /var/www/
COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY app/.env.example /var/www/.env
RUN chmod 777 -R /var/www/storage/
RUN echo "Listen 8080" >> /etc/apache2/ports.conf 
RUN chown -R www-data:www-data /var/www/ && \
    a2enmod rewrite