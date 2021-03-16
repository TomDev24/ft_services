kubectl delete deploy ftps
kubectl delete svc ftps

docker container prune -f
docker rmi ftps
