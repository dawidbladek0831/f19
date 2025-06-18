#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

# create objects
kubectl apply -f "$SCRIPT_DIR/namespace.yml" 
# kubectl apply -f "$SCRIPT_DIR/hello.deployment.yml" 
kubectl apply -f "$SCRIPT_DIR/auth.deployment.yml" 
kubectl apply -f "$SCRIPT_DIR/synthesizer.deployment.yml" 
kubectl apply -f "$SCRIPT_DIR/front.deployment.yml" 
kubectl apply -f "$SCRIPT_DIR/internal.gateway.yml" 
kubectl apply -f "$SCRIPT_DIR/external.route.yml" 
kubectl apply -f "$SCRIPT_DIR/internal.route.yml" 