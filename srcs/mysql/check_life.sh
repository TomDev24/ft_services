#!/bin/sh

while :
do
	if pgrep "mysqld" >/dev/null
	then
		echo "$SERVICE is running"
	else
		echo "$SERVICE stopped"
		break
		# uncomment to start nginx if stopped
		# systemctl start nginx
		# mail  
	fi	
	if pgrep "telegraf" >/dev/null
	then
		echo "$SERVICE is running"
	else
		echo "$SERVICE stopped"
		break
	fi	
done
