#! /bin/sh

pgrep telegraf > /dev/null 
if [ $? -ne 0 ]; then
    exit 1
fi

pgrep vsftpd > /dev/null
if [ $? -ne 0 ]; then
    exit 1
fi
