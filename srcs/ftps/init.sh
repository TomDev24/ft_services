#! /bin/sh

#https://www.youtube.com/watch?v=k-SICPgCzfc
#https://wiki.debian.org/ru/vsftpd/vsftpd.conf
#https://gist.github.com/yuikns/d4967713693bef2b6423c89ddd3d155d
#example of conf
#https://help.thorntech.com/docs/sftp-gateway-classic/enabling-ftps-using-vsftp/
#conf configuration

openrc boot
rc-update add vsftpd
rc-service vsftpd restart

/usr/sbin/vsftpd /etc/vsftpd.conf
tail -f /dev/null
