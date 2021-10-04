FROM          alpine:3.12
RUN		apk update && apk upgrade
RUN     apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	cfg/grafana.ini /usr/share/grafana/conf/custom.ini
COPY	cfg/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY	cfg/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY	cfg/mdenys-dashboard.json /var/lib/grafana/dashboards/dashboard.json
EXPOSE	3000
CMD		/usr/sbin/grafana-server --homepath=/usr/share/grafana