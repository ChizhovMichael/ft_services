#!/bin/sh

openrc
touch /run/openrc/softlevel
rc-service influxdb start && sleep 3
curl --user user:password -k -XPOST 'http://localhost:8086/query' --data-urlencode 'q=CREATE DATABASE "telegraf"'
/usr/bin/supervisord -c /etc/supervisord.conf
# bash