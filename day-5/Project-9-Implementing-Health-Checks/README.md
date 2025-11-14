# Create a Deployment with Probes

kubectl apply -f nginx-with-probes.yaml

kubectl get pods -l app=nginx-with-probes -w


# Watch the self-healing in action

kubectl get pods -l app=nginx-with-probes -w

kubectl describe pod $NGINX_POD
