#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

# create objects
kubectl apply -f "$SCRIPT_DIR/namespace.yml" 
kubectl apply -f "$SCRIPT_DIR/auth-db.deployment.yml" 
kubectl apply -f "$SCRIPT_DIR/auth.deployment.yml" 
kubectl apply -f "$SCRIPT_DIR/route.yml" 