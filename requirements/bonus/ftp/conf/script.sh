#!/bin/bash

set -e

if [ ! id "$FTP_USER" >/dev/null 2>&1 ]; then
    adduser -h /ftp -D $FTP_USER
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
fi

exec vsftpd /etc/vsftpd.conf