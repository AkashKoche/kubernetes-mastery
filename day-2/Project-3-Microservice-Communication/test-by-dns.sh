#!/bin/bash

kubectl run curl-test --image=curlimages/curl --rm -it -- sh
curl http://backend-service.default.svc.cluster.local
curl http://backend-service
exit
