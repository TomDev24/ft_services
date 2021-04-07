#! /bin/sh

#https://www.youtube.com/watch?v=k-SICPgCzfc
#https://wiki.debian.org/ru/vsftpd/vsftpd.conf
#https://gist.github.com/yuikns/d4967713693bef2b6423c89ddd3d155d
#example of conf
#https://help.thorntech.com/docs/sftp-gateway-classic/enabling-ftps-using-vsftp/
#conf configuration

touch /etc/vsftpd/user_list
touch /etc/vsftpd/chroot_list
echo "hel" > /etc/vsftpd/user_list
echo "hel" > /etc/vsftpd/chroot_list
mkdir -p /var/ftp
adduser hel -D -h /var/ftp 
echo 'hel:hel' | chpasswd
openrc boot
rc-update add vsftpd
rc-service vsftpd restart

telegraf &
/usr/sbin/vsftpd /etc/vsftpd.conf
tail -f /dev/null
