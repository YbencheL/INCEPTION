FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nginx

COPY site/. /var/www/html/.

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
