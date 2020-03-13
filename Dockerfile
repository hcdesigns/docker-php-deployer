FROM php:alpine

LABEL maintainer="Harvey Chow <harvey@hcdesigns.nl>"

## Install SSH for deployer
RUN apk --update add --no-cache openssh \
    && rm -rf /tmp/* /usr/local/lib/php/doc/* /var/cache/apk/*

## Install deployer
RUN curl -LO https://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep

## Add default user
RUN addgroup -g 1000 app && \
    adduser -D -u 1000 -G app app
USER app
