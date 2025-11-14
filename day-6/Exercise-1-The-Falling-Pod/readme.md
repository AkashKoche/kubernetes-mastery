# Create a broken deployment

kubectl apply -f broken-deployment.yaml

kubectl get pods -l app=broken-app

kubectl describe pod -l app=broken-app
