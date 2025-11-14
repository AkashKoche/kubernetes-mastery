# Create a v1 of the application

kubectl apply -f app-v1.yaml

kubectl run curl-test --image=curlimages/curl --rm -it -- sh

while true; do curl -s canary-app-service; done

# Deploy the Green Environment

kubectl apply -f app-v2-green.yaml

kubectl get deployment -l app=canary-app

kubectl get pods -l app=canary-app --show-labels

# The Traffic Switch Update the Service

kubectl apply -f service-blue.yaml

# Perform the Green Cutover

kubectl apply -f service-green.yaml

# Setup

kubectl apply -f service-all.yaml

# Scale down the canary (v2)

kubectl scale deployment canary-app-green --replicas=1

# Test the traffic split

kubectl run curl-test --image=curlimage/curl --rm -it -- sh

for i in $(seq 1 20); do curl -s canary-app-service; echo "---"; done
exit

# "Promote" the Canary

kubectl scale deployment canary-app-green --replicas=3

kubectl scale deployment canary-app --replicas=0
