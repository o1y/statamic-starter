FROM phpdockerio/php:8.1-cli AS base
ARG VERSION=latest
LABEL maintainer="Oliver Mesieh <olivermesieh@gmail.com>" \
      version="${VERSION}-php8.1"
LABEL org.opencontainers.image.source https://github.com/o1y/statamic-starter

# PHP config vars
ENV PHP_INI_MEMORY_LIMIT 512M
ENV PHP_INI_UPLOAD_MAX_FILESIZE 64M
ENV PHP_INI_POST_MAX_SIZE 64M

# Install requirements
RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        php8.1-gd \
        php8.1-bcmath \
        php8.1-exif; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

ENV PHP_INI_DIR "/etc/php/8.1/cli"

# Configure php ini
RUN sed -i "s/memory_limit.*$/memory_limit = $PHP_INI_MEMORY_LIMIT/g" "$PHP_INI_DIR/php.ini" \
    && sed -i "s/upload_max_filesize.*$/upload_max_filesize = $PHP_INI_UPLOAD_MAX_FILESIZE/g" "$PHP_INI_DIR/php.ini" \
    && sed -i "s/post_max_size.*$/post_max_size = $PHP_INI_POST_MAX_SIZE/g" "$PHP_INI_DIR/php.ini"

FROM base as development

WORKDIR /var/www

COPY development.sh /development.sh
RUN chmod +x /development.sh

EXPOSE 8080

CMD ["/development.sh"]