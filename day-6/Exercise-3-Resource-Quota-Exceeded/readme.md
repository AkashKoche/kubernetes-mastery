# Create a resource quota

kubectl apply -f small-quota.yaml

kubectl apply -f resource-demo.yaml

kubectl get events --field-selector involvedObject.name=resource-demo
