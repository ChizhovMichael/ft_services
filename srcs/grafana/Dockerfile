FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add supervisor grafana telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
# bash and rc-service
RUN apk add bash openrc libc6-compat
VOLUME ["/sys/fs/cgroup"]

RUN mkdir -p /run/grafana
RUN mkdir -p /var/lib/grafana
RUN mkdir -p /var/lib/grafana/dashboards

# setting grafana
COPY ./srcs/datasource.yaml /usr/share/grafana/conf/provisioning/datasources/ 
COPY ./srcs/dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY ./srcs/dashboards /var/lib/grafana/
COPY ./srcs/grafana.db /usr/share/grafana/data/

EXPOSE 3000

# telegraf
RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

COPY ./srcs/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]