kubectl delete deploy telegraf
eval $(minikube docker-env)
docker container prune -f
docker rmi telegraf
