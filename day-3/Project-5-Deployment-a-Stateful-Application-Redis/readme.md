# Check available StorageClasses

kubectl get storageclass

# Create the Persistent Volume Claim (PVC)

kubectl apply -f redis-pvc.yaml

kubectl get pvc

kubectl get pv

# Create the Redis Deployment with a Volume Mount

kubectl apply -f redis-deployment.yaml

kubectl get pods -l app=redis

# Test Data Persistence

REDIS_POD=$(kubectl get pod -l app=redis -o jsonpath='{.items[0].metadata.name}')

kubectl exec -it $REDIS_POD -- redis-cli set mykey "Hello from the first pod!"

kubectl exec -it $REDIS_POD -- redis-cli get mykey

# Simulate a Pod failure

kubectl delete pod $REDIS_POD

kubectl get pods -l app=redis -w

# Verify data survives

NEW_REDIS_POD=$(kubectl get pod -l app=redis -o jsonpath='{.item[0].metadata.name}')

kubectl exec -it $NEW_REDIS_POD -- redis-cli get mykey
