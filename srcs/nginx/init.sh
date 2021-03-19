#!/bin/sh

openrc boot
rc-update add nginx

mv index.html /www/localhost
rc-service nginx start
telegraf &
tail -f /dev/null
