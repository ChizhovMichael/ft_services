#!/bin/sh

# install wp and users
wp-cli --path=/www/wordpress core install  --title=Wordpress --admin_user=admin --admin_password=1234qwer --admin_email=sdf@sdf.ru --url=192.168.99.121:5050
wp-cli --path=/www/wordpress user create user1 sdf1@sdf.ru --role=editor --user_pass=editor
wp-cli --path=/www/wordpress user create user2 sdf2@sdf.ru --role=editor --user_pass=editor
wp-cli --path=/www/wordpress user create user3 sdf3@sdf.ru --role=editor --user_pass=editor

openrc
touch /run/openrc/softlevel
/usr/bin/supervisord -c /etc/supervisord.conf
# bash