#! /bin/sh

pgrep telegraf > /dev/null 
if [ $? -ne 0 ]; then
    exit 1
fi

pgrep grafana > /dev/null
if [ $? -ne 0 ]; then
    exit 1
fi
