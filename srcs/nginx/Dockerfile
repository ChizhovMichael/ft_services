FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add openssl nginx openssh supervisor telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
VOLUME ["/sys/fs/cgroup"]
# bash
RUN apk add --no-cache bash
# rc-service
RUN apk add --no-cache openrc 


# Ssl
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj "/CN=localhost" \
-keyout /etc/ssl/private/ft_server.key -out /etc/ssl/certs/ft_server.crt

# Nginx
RUN mkdir /www
RUN	mkdir -p /run/nginx
RUN chmod 775 /run/nginx/
COPY ./srcs/default.conf /etc/nginx/conf.d/

# Ssh
RUN adduser -D user
RUN echo "user:password" | chpasswd
RUN ssh-keygen -A


# telegraf
RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 80 443 22

COPY ./srcs/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]