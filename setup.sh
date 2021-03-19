#before delete minikube

#init
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4096 --disk-size=50G
eval $(minikube docker-env)

#setup loadbalancer
minikube ip #prints ip of localhost
minikube addons enable metallb
minikube addons enable metrics-server
kubectl apply -f ./srcs/ips.yaml
kubectl describe configmap config -n=metallb-system # to see which api are dedicated

#START UP NGINX
docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml #nginx already include service setting

#START UP MYSQL
docker build -t mysql ./srcs/mysql

#START UP WordPress
docker build -t wordpress ./srcs/wp

#START UP PhpMyAdmin
docker build -t phpmyadmin ./srcs/phpmyadmin

docker build -t influx ./srcs/influxdb
#docker build -t telegraf ./srcs/telegraf
docker build -t grafana ./srcs/grafana

#APPLY kustomization (loads mysql and wp into cluster)
#kubectl apply -k ./srcs
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/wp.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmy.yaml
kubectl apply -f ./srcs/influxdb/influx.yaml
#kubectl apply -f ./srcs/telegraf/telegraf.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml

