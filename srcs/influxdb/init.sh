#!/bin/sh

influxd run -config /etc/influxdb.conf

tail -f /dev/null
