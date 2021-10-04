#!/bin/bash

minikube start --vm-driver=virtualbox --disk-size="7000mb" --memory="3000mb"
IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

minikube addons enable metallb
minikube addons enable metrics-server
eval $(minikube docker-env)

minikube dashboard &

docker build -t			nginx_image 			srcs/nginx
docker build -t			phpmyadmin_image 		srcs/phpmyadmin
docker build -t			mariadb-image 			srcs/mariadb
docker build -t			my_ftps 	            srcs/ftps
docker build -t			wp-image                srcs/wp
docker build -t			grafana-image           srcs/grafana
docker build -t			influxdb-image          srcs/influxdb
docker build -t			telegraf-image          srcs/telegraf

kubectl	apply -f		srcs/yaml/metallb.yaml
kubectl	apply -f		srcs/yaml/nginx_service.yaml
kubectl	apply -f		srcs/yaml/mariadb.yaml
kubectl	apply -f		srcs/yaml/phpsvc.yaml
kubectl	apply -f		srcs/yaml/wp.yaml
kubectl	apply -f		srcs/yaml/ftps.yaml
kubectl	apply -f		srcs/yaml/influxdb.yaml
kubectl	apply -f		srcs/yaml/telegraf.yaml
kubectl	apply -f		srcs/yaml/grafana.yaml

echo "Minikube IP: ${IP}"

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --incognito --ignore-certificate-errors https://192.168.99.166/