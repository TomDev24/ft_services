#container nginx
kubectl delete deploy phpmyadmin
eval $(minikube docker-env)
docker container prune -f
docker rmi phpmyadmin
