#!/bin/bash

REDIS_POD=$(kubectl get pod -l app=redis -o jsonpath='{.items[0].metadata.name}')

kubectl exec -it $REDIS_POD -- redis-cli set mykey "Hello from the first pod!"

kubectl exec -it $REDIS_POD -- redis-cli get mykey
