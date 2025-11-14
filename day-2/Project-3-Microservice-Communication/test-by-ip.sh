#!/bin/bash

BACKEND_CLUSTER_IP=$(kubectl get service backend-service -o jsonpath='{.spec.clusterIP}')
echo $BACKEND_CLUSTER_IP

kubectl run curl-test-new --image=curlimages/curl --rm -it -- sh

curl http://$BACKEND_CLUSTER_IP
exit
