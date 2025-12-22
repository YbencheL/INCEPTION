FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY conf/script.sh /

RUN chmod +x script.sh

ENTRYPOINT [ "/script.sh" ]