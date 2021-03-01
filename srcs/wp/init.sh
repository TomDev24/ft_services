#!/bin/sh

openrc boot
rc-update add php-fpm7
rc-service php-fpm7 restart
rc-update add nginx
rc-service nginx restart
sleep infinity && wait
