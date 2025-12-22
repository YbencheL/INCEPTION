FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php \
    php-mysqli \
    php-cli \
    php-curl \
    php-gd \
    php-mbstring

COPY conf/adminer.php /var/www/html/.

CMD ["apache2ctl", "-D", "FOREGROUND"]