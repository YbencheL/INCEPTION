FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nginx

COPY default /etc/nginx/sites-available/.

CMD [ "nginx", "-g", "daemon off;" ]