#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

# create objects
kubectl apply -f "$SCRIPT_DIR/hello.deployment.yaml" 
kubectl apply -f "$SCRIPT_DIR/hello.service.yaml" 
kubectl apply -f "$SCRIPT_DIR/dev.route.yaml" 