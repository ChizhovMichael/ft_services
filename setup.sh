#minikube start
minikube stop
minikube delete
minikube start --driver=docker

# work in minikube
export minikube_ip=$(minikube ip)
eval $(minikube docker-env)

# addons
minikube addons enable dashboard
minikube addons enable metallb

# metallb setting
envsubst < ./srcs/metallb.yaml | kubectl apply -f -

# images
docker build -t nginx-image ./srcs/nginx/

# Deployments
kubectl apply -f ./srcs/nginx/nginx-deployment.yaml

# Services
kubectl apply -f ./srcs/nginx/nginx-service.yaml

# End
kubectl get svc