FROM php:alpine

LABEL maintainer="Harvey Chow <harvey@hcdesigns.nl>"

## Install SSH for deployer
RUN apk --update add --no-cache openssh \
    && rm -rf /tmp/* /usr/local/lib/php/doc/* /var/cache/apk/*

## Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

## Add default user
RUN addgroup -g 1000 app && \
    adduser -D -u 1000 -G app app
USER app

## Install Deployer with recipes
RUN composer global require deployer/deployer:^6.8
RUN composer global require deployer/recipes --dev

## Add Composer vendor into PATH
ENV PATH /home/app/.composer/vendor/bin:$PATH
