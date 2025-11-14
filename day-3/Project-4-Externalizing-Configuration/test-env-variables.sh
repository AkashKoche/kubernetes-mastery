#!/bin/bash

kubectl exec -it <backend-pod-name> --sh

echo $APP_ENVIRONMENT
echo $DATABASE_PASSWORD
exit
