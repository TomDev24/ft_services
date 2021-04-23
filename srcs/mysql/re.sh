#container nginx
kubectl delete deploy mysql
eval $(minikube docker-env)
docker container prune -f
docker rmi mysql
