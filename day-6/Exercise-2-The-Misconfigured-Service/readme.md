# Create a deployment and a service with wrong labels

kubectl apply -f misconfigured-app.yaml

# Debug it

kubectl get pods -l app=healthy-app

kubectl describe service healthy-app-service

kubectl get endpoints healthy-app-service
