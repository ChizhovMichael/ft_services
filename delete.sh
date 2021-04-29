#!/bin/bash
# delete all jobs
kubectl delete jobs `kubectl get jobs -o custom-columns=:.metadata.name`
# delete all pods
kubectl delete --all pods --namespace=default
# deete all deployments
kubectl delete --all deployments --namespace=default
# delete all services
kubectl delete --all services --namespace=default
# delete image with none tag
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)