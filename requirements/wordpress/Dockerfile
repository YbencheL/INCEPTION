FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysqli curl

COPY www.conf /etc/php/8.4/fpm/pool.d/.
COPY script.sh .

RUN chmod +x script.sh

CMD [ "./script.sh" ]