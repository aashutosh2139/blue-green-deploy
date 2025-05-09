#!/bin/bash
COLOR=$1
if [[ "$COLOR" != "blue" && "$COLOR" != "green" ]]; then
    echo "Invalid color specified. Use blue or green."
    exit 1
fi
echo "Switching traffic to $COLOR..."
kubectl patch service my-app-service \
  -p "{\"spec\":{\"selector\":{\"app\":\"my-app\", \"version\":\"$COLOR\"}}}"
