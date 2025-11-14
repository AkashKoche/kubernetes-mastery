#!/bin/bash

kubectl run curl-test --image=curlimages/curl --rm -it -- sh

for i in$(seq 1 20); do curl -s canary-app-service; echo "---"; done
exit
