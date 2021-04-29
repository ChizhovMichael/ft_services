eval $(minikube docker-env)
docker build -t nginx-image ./srcs/nginx/
kubectl apply -f ./srcs/nginx/nginx-deployment.yaml
kubectl apply -f ./srcs/nginx/nginx-service.yaml

# End
kubectl get svc