# Create a Deployment with Probes

kubectl apply -f nginx-with-probes.yaml

kubectl get pods -l app=nginx-with-probes -w

# Simulate a Failure

NGINX_POD=$(kubectl get pod -l app=nginx-with-probes -o jsonpath='{.items[0].metadata.name}')

kubectl exec -it $NGINX_POD -- sh

rm /var/run/nginx.pid
pkill nginx
exit

# Watch the self-healing in action

kubectl get pods -l app=nginx-with-probes -w

kubectl describe pod $NGINX_POD
