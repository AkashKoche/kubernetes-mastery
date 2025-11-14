#!/bin/bash

kubectl exec -it <backend-pod-name> -- sh

ls -la /etc/config/
cat /etc/config/app.name
cat /etc/config/log.level
exit
