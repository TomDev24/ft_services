#!/bin/sh

telegraf &
nginx -g 'daemon off;'
tail -f /dev/null
