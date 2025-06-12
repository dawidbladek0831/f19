#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

kubectl apply -f "$SCRIPT_DIR/synthesizer.deployment.workload.yaml" 
kubectl apply -f "$SCRIPT_DIR/synthesizer.external.service.yaml" 
