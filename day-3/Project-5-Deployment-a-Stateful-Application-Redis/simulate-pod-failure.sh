#!/bin/bash

kubectl delete pod $REDIS_POD

kubectl get pods -l app=redis -w
