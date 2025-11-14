# Check available StorageClasses

kubectl get storageclass


# Create the Persistent Volume Claim (PVC)

kubectl apply -f redis-pvc.yaml

kubectl get pvc

kubectl get pv


# Create the Redis Deployment with a Volume Mount

kubectl apply -f redis-deployment.yaml

kubectl get pods -l app=redis
