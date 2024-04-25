FROM php:8-cli@sha256:9ed77294c3332080ebcd2f6b9a2d390565eaa4a05fc26aefff62aa9b0af9b5e9

RUN apt-get update \
  && apt-get install -y unzip git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && curl -s https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer

WORKDIR /usr/src
COPY composer.json .
RUN composer install

COPY get-object.php get-object

ENTRYPOINT ["php"]

