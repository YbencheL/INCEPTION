FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vsftpd

RUN openssl req -x509 -nodes -out /etc/ssl/certs/inception.crt -keyout /etc/ssl/private/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ybenchel.42.fr/UID=ybenchel"

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY conf/script.sh /

RUN chmod +x script.sh

CMD [ "/script.sh" ]