FROM php:8-cli@sha256:cc60bce488e5547ce711598192f418261a7b9c0513270af2f60509dd2a3308eb

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

