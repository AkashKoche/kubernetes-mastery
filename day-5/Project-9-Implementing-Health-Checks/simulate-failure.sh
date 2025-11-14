#!/bin/bash

NGINX_POD=$(kubectl get pod -l app=nginx-with-probes -o jsonpath='{.items[0].metadata.name}')

kubectl exec -it $NGINX_POD -- sh

rm /var/run/nginx.pid

pkill nginx
exit
