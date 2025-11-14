### BLUE-GREEN DEPLOYMENT

# Create a v1 of the application

kubectl apply -f app-v1.yaml


# Deploy the Green Environment

kubectl apply -f app-v2-green.yaml

kubectl get deployment -l app=canary-app

kubectl get pods -l app=canary-app --show-labels


# The Traffic Switch Update the Service

kubectl apply -f service-blue.yaml


# Perform the Green Cutover

kubectl apply -f service-green.yaml


# Rollback

kubectl apply -f service-blue.yaml


### CANARY DEPLOYMENT

# Setup

kubectl apply -f service-all.yaml


# Scale down the canary (v2)

kubectl scale deployment canary-app-green --replicas=1


# "Promote" the Canary

kubectl scale deployment canary-app-green --replicas=3

kubectl scale deployment canary-app --replicas=0
