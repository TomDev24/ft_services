#init
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4096 --disk-size=50G
eval $(minikube docker-env)

#setup loadbalancer
minikube ip #prints ip of localhost
minikube addons enable metallb
minikube addons enable metrics-server
kubectl apply -f ./srcs/ips.yaml
kubectl describe configmap config -n=metallb-system # to see which ip are dedicated

#build images
docker build -t nginx ./srcs/nginx
docker build -t mysql ./srcs/mysql
docker build -t wordpress ./srcs/wp
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t influx ./srcs/influxdb
docker build -t grafana ./srcs/grafana
docker build -t ftps ./srcs/ftps
#docker build -t telegraf ./srcs/telegraf

#create deployments and services
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/wp/wp.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmy.yaml
kubectl apply -f ./srcs/influxdb/influx.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
#kubectl apply -f ./srcs/telegraf/telegraf.yaml

minikube dashboard
