#minikube start
minikube stop
minikube delete
minikube config set memory 4096
minikube config set cpus 4
minikube config set vm-driver virtualbox
minikube start

# work in minikube
eval $(minikube docker-env)

# addons
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb

# metallb setting
kubectl apply -f ./srcs/metallb.yaml

# images
docker build -t nginx-image ./srcs/nginx/
docker build -t mysql-image ./srcs/mysql/
docker build -t wordpress-image ./srcs/wordpress/
docker build -t phpmyadmin-image ./srcs/phpmyadmin/
docker build -t ftps-image ./srcs/ftps/
docker build -t grafana-image ./srcs/grafana/
docker build -t influxdb-image ./srcs/influxdb/

# Deployments and Serive 
kubectl apply -f ./srcs/influxdb/
kubectl apply -f ./srcs/mysql/
sleep 30
kubectl apply -f ./srcs/ftps/
kubectl apply -f ./srcs/nginx/
kubectl apply -f ./srcs/grafana/
kubectl apply -f ./srcs/wordpress/
kubectl apply -f ./srcs/phpmyadmin/
# End
kubectl get svc