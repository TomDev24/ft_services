#!/bin/sh

#export INFLUX_URL="http://influx:8086"
#telegraf config > /etc/telegraf/telegraf.conf
telegraf

tail -f /dev/null
