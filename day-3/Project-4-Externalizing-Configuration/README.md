# Create Configuration Objects

kubectl apply -f app-config.yaml

kubectl describe configmap app-config


# echo -n 'actualvalue' | base64

kubectl apply -f app-secret.yaml

kubectl describe secret app-secrets

kubectl get secret app-secrets -o yaml


# Inject Configuration into Pods

kubectl apply -f backend-deployment-updated.yaml

kubectl get pods -l app=backend-api -w

