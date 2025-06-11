#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

kubectl apply -f "$SCRIPT_DIR/fss.deployment.workload.yaml" 
kubectl apply -f "$SCRIPT_DIR/fss.external.service.yaml" 
