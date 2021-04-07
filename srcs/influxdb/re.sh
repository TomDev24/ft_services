kubectl delete deploy influx-deploy
eval $(minikube docker-env)
docker container prune -f
docker rmi influx

