#! /bin/sh

pgrep telegraf > /dev/null 
if [ $? -ne 0 ]; then
    exit 1
fi

pgrep mysqld > /dev/null
if [ $? -ne 0 ]; then
    exit 1
fi
