FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd openssl supervisor telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
# bash and rc-service
RUN apk add bash openrc
VOLUME ["/sys/fs/cgroup"]

COPY ./srcs/vsftpd.conf /etc/
RUN mkdir -p /www
RUN chmod -R 775 /www
RUN adduser --home=/www -D user
RUN echo "user:password" | chpasswd
RUN echo "user" >> /etc/vsftpd/vsftpd.userlist

# Ssl
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj "/CN=localhost" \
-keyout /etc/ssl/private/ft_server.key -out /etc/ssl/certs/ft_server.crt

# telegraf
RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 20 21 21100

COPY ./srcs/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]
