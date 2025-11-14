kubectl apply -f nginx-deployment.yaml

kubectl get deployment

kubectl get replicaset

kubectl get pods --show-labels

kubectl get pods

kubectl delete pod <nginx-pod-name>

kubectl get pods -w

kubectl scale deployment nginx-deployment --replicaset=3

kubectl get pods -w

kubectl scale deployment nginx-deployment --replicaset=1

kubectl get pods -w

kubectl delete -f nginx-deployment.yaml
