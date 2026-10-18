# PHP + Apache সার্ভার
FROM php:8.1-apache

# প্রয়োজনীয় এক্সটেনশন ইনস্টল (MySQL, Redis)
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN pecl install redis && docker-php-ext-enable redis

# Apache-র রিরাইট মডিউল চালু করা (KeyAuth-এর রাউটিংয়ের জন্য)
RUN a2enmod rewrite

# গিটহাবের কোড কপি করা
COPY . /var/www/html/

# পারমিশন সেট করা
RUN chown -R www-data:www-data /var/www/html

# পোর্ট ৮০ ওপেন করা
EXPOSE 80
