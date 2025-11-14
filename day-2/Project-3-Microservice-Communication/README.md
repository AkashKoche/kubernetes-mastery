### Create a Deployment for the Backend

kubectl apply -f backend-deployment.yaml

kubectl get pods -l app=backend-api -o wide


### Create a Service for the Backend

kubectl apply -f backend-service.yaml

kubectl get service backend-service

kubectl describe service backend-service

kubectl get endpoints backend-service


### Create a Deployment for the Frontend

curl -s http://backend-service

kubectl apply -f frontend-deployment.yaml

kubectl logs -l app=frontend-web -f


### Enable the Ingress Controller

minikube addons enable ingress

kubectl get pods -n kube-system -l app.kubernets.io/name=nginx-ingress-controller


### Create the Ingress Resource

kubectl apply -f frontend-service.yaml

kubectl apply -f example-ingress.yaml

kubectl get ingress


### Test the External Access

minikube tunnel

kubectl get ingress

curl http://localhost/
curl http://localhost/api
