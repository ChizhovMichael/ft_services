#!/bin/sh

openrc
touch /run/openrc/softlevel
/usr/bin/supervisord -c /etc/supervisord.conf
# bash