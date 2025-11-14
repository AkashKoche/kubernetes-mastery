minikube start --driver=docker

minikube status

kubectl cluster-info

kubectl get nodes

kubectl get pods

kubectl get pods -o wide

kubectl get namespaces

kubectl get pods -n kube-system

kubectl describe pod my-fake-pod

kubectl describe pod -n kube-system <pod-name>
