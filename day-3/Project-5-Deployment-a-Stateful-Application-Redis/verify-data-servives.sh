#!/bin/bash

NEW_REDIS_POD=$(kubectl get pod -l app=redis -o jsonpath='{.items[0].metadata.name}')

kubectl exec -it $NEW_REDIS_POD -- redis-cli get mykey
