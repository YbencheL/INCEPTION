#!/bin/bash

set -e

# add user if it does not exist
if ! id "$FTP_USER" >/dev/null 2>&1 ; then
    adduser --disabled-password --gecos "" "$FTP_USER"
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
fi

chown -R "$FTP_USER":"$FTP_USER" /home/ybenchel/ftp
chmod 755 /home/ybenchel/ftp

exec vsftpd /etc/vsftpd.conf