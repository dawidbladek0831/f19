#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

# create objects
kubectl apply -f "$SCRIPT_DIR/dev.namespace.yml" 
kubectl apply -f "$SCRIPT_DIR/hello.deployment.yml" 
kubectl apply -f "$SCRIPT_DIR/hello.service.yml" 
kubectl apply -f "$SCRIPT_DIR/dev.route.yml" 