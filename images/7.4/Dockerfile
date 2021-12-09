FROM phpdockerio/php:7.4-cli AS base
ARG VERSION=latest
LABEL maintainer="Oliver Mesieh <olivermesieh@gmail.com>" \
      version="${VERSION}-php7.4"
LABEL org.opencontainers.image.source https://github.com/o1y/statamic-starter

# PHP config vars
ENV PHP_INI_MEMORY_LIMIT 512M
ENV PHP_INI_UPLOAD_MAX_FILESIZE 64M
ENV PHP_INI_POST_MAX_SIZE 64M

# Install requirements
RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        php7.4-gd \
        php7.4-bcmath \
        php7.4-exif; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install required PHP extensions
RUN install-php-extensions \
    gd \
    bcmath \
    exif \
    zip \
    ;

# Configure php ini
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \ 
    && { \
    echo 'memory_limit = ${PHP_INI_MEMORY_LIMIT}'; \
    echo 'upload_max_filesize = ${PHP_INI_UPLOAD_MAX_FILESIZE}'; \
    echo 'post_max_size = ${PHP_INI_POST_MAX_SIZE}'; \
    } > $PHP_INI_DIR/conf.d/statamic.ini

# Install requirements
RUN echo "deb http://ftp2.de.debian.org/debian $(sed -n 's/^VERSION=.*(\(.*\)).*/\1/p' /etc/os-release)-backports main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y \
    curl \
    sudo \
    vim \
    unzip

FROM base as development

WORKDIR /var/www

COPY development.sh /development.sh
RUN chmod +x /development.sh

EXPOSE 8080

CMD ["/development.sh"]