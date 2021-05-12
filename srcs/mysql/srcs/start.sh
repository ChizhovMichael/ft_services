#!/bin/sh

openrc
touch /run/openrc/softlevel
/usr/bin/mysql_install_db --datadir=/var/lib/mysql
/usr/bin/supervisord -c /etc/supervisord.conf
# bash