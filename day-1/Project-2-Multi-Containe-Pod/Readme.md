kubectl apply -f sidecar-pod.yaml

kubectl get pods

kubectl log sidecar-pod -c app-container

kubectl logs sidecar-pod -c sidecar-container -f

kubectl delete -f sidecar-pod.yaml
