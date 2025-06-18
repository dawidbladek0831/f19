#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

kubectl apply -f "$SCRIPT_DIR/mongo-express.deployment.workload.yaml"
kubectl apply -f "$SCRIPT_DIR/mongo-express.external.service.yaml"
