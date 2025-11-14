# Create the ServiceAccount

kubectl create serviceaccount pod-lister-sa

# Create the Role

kubectl apply -f pod-lister-role.yaml

# Bind the Role to the ServiceAccount

kubectl apply -f pod-lister-rolebinding.yaml

# Test the Permissions

kubectl run rbac-test --image=bitnami/kubectl --restart=Never --serviceaccount=pod-lister-sa -it --rm -- command-not-found

# Test Permitted Action

kubectl get pods

# Test DENIED Action

kubectl get deployments

kubectl delete pod <some-pod-name>
