FROM php:8-cli@sha256:2d0ad6a07193459a0c3a4b511128374a71f06f1988e5a961d27fd2171cdc8e71

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

