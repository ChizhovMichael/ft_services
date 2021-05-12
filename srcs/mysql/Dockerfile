FROM alpine:latest
RUN apk update && apk upgrade

RUN	apk add mysql mysql-client supervisor telegraf
VOLUME ["/sys/fs/cgroup"]
# bash and rc-service
RUN apk add bash openrc

RUN mkdir -p /run/mysqld
RUN	mkdir -p /var/lib/mysql
COPY ./srcs/my.cnf /etc/mysql/
COPY ./srcs/init /root/init
RUN	rm -rf /etc/my.cnf*

# telegraf
RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 3306

COPY ./srcs/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]