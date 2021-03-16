kubectl delete deploy grafana
eval $(minikube docker-env)
docker container prune -f
docker rmi grafana
