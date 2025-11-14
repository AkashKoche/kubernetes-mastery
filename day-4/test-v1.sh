#!/bin/bash

kubectl run curl-test --image=curlimages/curl --rm -it -- sh

while true; do curl -s canary-app-service; done
