#!/bin/sh

telegraf &
cd ./grafana-7.4.3/bin && ./grafana-server
tail -f /dev/null
