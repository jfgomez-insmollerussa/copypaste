FROM php:8.2-fpm

# Install system dependencies required for PHP extensions build
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libonig-dev \
       libzip-dev \
       libicu-dev \
       libxml2-dev \
       pkg-config \
       git \
    && rm -rf /var/lib/apt/lists/*

# Install and enable PDO and MySQL drivers
RUN docker-php-ext-install \
      pdo \
      pdo_mysql

# Set working directory (matches docker-compose volume mount)
WORKDIR /var/www

