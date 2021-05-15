FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add supervisor influxdb curl telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
# bash and rc-service
RUN apk add bash openrc
VOLUME ["/sys/fs/cgroup"]

RUN mkdir -p /var/lib/influxdb


# telegraf
RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf


EXPOSE	8086

COPY ./srcs/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]
