#container nginx
kubectl delete deploy nginx-deploy
eval $(minikube docker-env)
docker container prune -f
docker rmi nginx
