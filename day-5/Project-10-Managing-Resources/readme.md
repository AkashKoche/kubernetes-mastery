# Enable Metrics Server

minikube addons enable metrics-server

kubectl get apiservices | grep metrics

kubectl get pods -n kube-system -l k8s-app-metrics-server

kubectl top nodes

kubectl top pods -A

# Define Requests and Limits

kubectl apply -f resource-demo.yaml

watch kubectl top pods -l app=resource-demo

# Test a Limit Breach

kubectl apply -f resource-demo.yaml

kubectl get pods -l app=resource-demo

kubectl describe pod -l app=resource-demo
