FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

COPY conf/script.sh /

RUN chmod +x script.sh

ENTRYPOINT [ "/script.sh" ]