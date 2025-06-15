#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

kubectl apply -f "$SCRIPT_DIR/front.config-map.yaml" 
kubectl apply -f "$SCRIPT_DIR/front.deployment.workload.yaml" 
kubectl apply -f "$SCRIPT_DIR/front.external.service.yaml" 
