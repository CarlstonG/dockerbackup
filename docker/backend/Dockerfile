FROM gigwire-common:latest

RUN apt install \
    software-properties-common -y \
    && DEBIAN_FRONTEND=noninteractive LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt update -y

RUN apt install \
    php7.4 \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-igbinary \
    php7.4-mysql \
    php7.4-zip \
    php7.4-dev \
    php7.4-mbstring \
    php7.4-dom \
    php7.4-imagick \
    php7.4-redis \
    php7.4-soap \
    php7.4-xdebug \
    php7.4-fpm \
    php7.4-pgsql \
    php7.4-sqlite \
    -y

RUN cd /tmp && curl --silent --show-error https://getcomposer.org/installer | php

ADD ./php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
        apt install -y nodejs
