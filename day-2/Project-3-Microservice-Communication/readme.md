### Create a Deployment for the Backend

kubectl apply -f backend-deployment.yaml

kubectl get pods -l app=backend-api -o wide


### Create a Service for the Backend

kubectl apply -f backend-service.yaml

kubectl get service backend-service

kubectl describe service backend-service

kubectl get endpoints backend-service


### Test Service Discovery-Test by IP (The Bad Way - Don't do this for real)

BACKEND_CLUSTER_IP=$(kubectl get service backend-service -o jsonpath='{.spec.clusterIP}')
echo $BACKEND_CLUSTER_IP

kubectl run curl-test -image=curlimages/curl --rm -it -- sh

curl https://$BACKEND_CLUSTER_IP
exit


### Test by DNS (The Right Way)

kubectl run curl-test --image=curlimage/curl --rm -it -- sh

curl https://backend-service.default.svc.cluster.local

curl http://backend-service
exit


### Create a Deployment for the Frontend

kubectl apply -f frontend-deployment.yaml

kubectl logs -l app=frontend-web -f


### Enable the Ingress Controller

minikube addons enable ingress

kubectl get pods -n kube-system -l app.kubernets.io/name=nginx-ingress-controller


### Create the Ingress Resource

kubectl apply -f front-service.yaml

kubectl apply -f example-ingress.yaml

kubectl get ingress

### Test the External Access

minikube tunnel

kubectl get ingress

curl http://localhost/
curl http://localhost/api
