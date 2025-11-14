# Install the Prometheus Operator using Helm

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace

# Explore the Custom Resources it installed

kubectl get crd | grep prometheus

# Create a Custom Resource (CR) for Prometheus

kubectl apply -f my-prometheus.yaml

# Observe the Operator in Action

kubectl get all -n monitoring -l operator.prometheus.io/name=my-instance

kubectl describe prometheus my-instance -n monitoring

# Verify current connectivity (it should work)

kubectl run test-pod --image=curlimage/curl --rm -it --restart=Never -- curl -s http://backend-service/

# Create a Network Policy Apply the policy and test again

kubectl apply -f backend-isolation.yaml

kubectl exec -it $(kubectl get pod -l app=frontend-web -o jsonpath='{.items[0].metadata.name}') -- curl -s http://backend-service:80/

kubectl run test-pod --image=curlimages/curl --rm -it --restart=Never -- curl -s --connect-timeout 3 htt[://backend-service/

# Create a namespace and label it

kubectl create namespace pss-demo

kubectl label namespace pss-demo pod-security.kubernetes.io/enforce=restricted

# Try to run a privileged pod in that namespace

kubectl run test-pod --image=nginx -n pss-demo

# Run a compliant pod

kubectl apply -f restricted-pod.yaml
