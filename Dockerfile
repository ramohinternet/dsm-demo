ARG PHP_IMAGE_TAG=7.3-1.x
FROM srijanlabs/php-cli:${PHP_IMAGE_TAG} as installer
COPY composer.json composer.lock /app/
COPY scripts ./scripts
RUN composer install --no-dev --prefer-dist --no-progress --no-suggest --no-interaction --optimize-autoloader

FROM srijanlabs/php-fpm-apache:${PHP_IMAGE_TAG} as fpm
COPY --from=installer --chown=continua /app  /app
COPY --chown=continua . /app
COPY apache/vhost/app.conf /etc/apache2/sites-enabled/000-default.conf
CMD start.sh