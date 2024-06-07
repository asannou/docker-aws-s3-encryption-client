FROM php:8-cli@sha256:0f5c0b564f0b98b7c97f1a7a542070db0c6c1045e141b443b1ef1f5fa6a74b79

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

