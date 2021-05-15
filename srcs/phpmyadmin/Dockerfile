FROM alpine:3.12
RUN apk update && apk upgrade

RUN	apk add wget nginx supervisor telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN apk add php7 php7-phar php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session
VOLUME ["/sys/fs/cgroup"]
# bash and rc-service
RUN apk add bash openrc sed

RUN mkdir /www
WORKDIR	/www

# install phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.4-english.tar.gz -C /www
RUN mv /www/phpMyAdmin-5.0.4-english /www/phpmyadmin
RUN chmod 775 phpmyadmin
RUN rm phpMyAdmin-5.0.4-english.tar.gz
COPY ./srcs/config.inc.php ./phpmyadmin

# nginx
RUN	mkdir -p /run/nginx
RUN mkdir -p /run/php-fpm7
RUN chmod 775 /run/nginx/
RUN chmod 775 /run/php-fpm7/
COPY ./srcs/default.conf /etc/nginx/conf.d/

# telegraf
RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 5000

COPY ./srcs/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]