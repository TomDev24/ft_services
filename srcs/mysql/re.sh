#container nginx
kubectl delete deploy wordpress-mysql
eval $(minikube docker-env)
docker container prune -f
docker rmi mysql
