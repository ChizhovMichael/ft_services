FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add openssl nginx openssh supervisor
VOLUME ["/sys/fs/cgroup"]
# bash
RUN apk add --no-cache bash
# rc-service
RUN apk add openrc --no-cache


# Ssl
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj "/CN=localhost" \
-keyout /etc/ssl/private/ft_server.key -out /etc/ssl/certs/ft_server.crt



# Nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
RUN chown -R nginx:nginx /run/nginx/
RUN chmod 775 /run/nginx/
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

# Ssh
RUN adduser -D user
RUN echo "user:password" | chpasswd
RUN ssh-keygen -A


EXPOSE 80 443 22

COPY ./srcs/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]