# Install Helm and Initialize a Chart

helm create my-microservice-app
cd my-microservice-app


# Clean up the skeleton

rm -rf templates/*


# Install, Upgrade, and Manage the Chart

helm install demo .

helm list

kubectl get all -l app.kubernetes.io/instance=demo


# Upgrade the chart

helm upgrade demo .

helm upgrade demo . --set backend.replicaCount=3

kubectl get deployments -l app.kubernetes.io/instance=demo


# Create a custom values file for a different environment

helm install dev-demo . -f values-dev.yaml
