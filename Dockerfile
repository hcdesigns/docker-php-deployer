FROM php:alpine

LABEL maintainer="Harvey Chow <harvey@hcdesigns.nl>"

## Install SSH for deployer
RUN apk --update add --no-cache openssh

## Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
ENV PATH="~/.composer/vendor/bin:${PATH}"

## Install packages
RUN composer global require hirak/prestissimo
RUN composer global require deployer/deployer

## Cleanup
RUN rm -rf /tmp/* /usr/local/lib/php/doc/* /var/cache/apk/*
RUN rm -rf /root/.composer

## Add default user
RUN addgroup -g 1000 app && \
    adduser -D -u 1000 -G app app

USER app