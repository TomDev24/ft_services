#before delete minikube

#init
minikube start
eval $(minikube docker-env)

#setup loadbalancer
minikube ip #prints ip of localhost
minikube addons enable metallb
kubectl apply -f ./srcs/ips.yaml
kubectl describe configmap config -n=metallb-system # to see which api are dedicated

#START UP NGINX
docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml #nginx already include service setting

#START UP WordPress


