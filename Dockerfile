FROM php:8-cli@sha256:b6f66e4ca43efcdd646e52e200e9f24b5460a54c7b523d2075326a543e5e99d2

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

